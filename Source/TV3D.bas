Attribute VB_Name = "TV3D"



Public TV As TVEngine
Public TexF As TVTextureFactory
Public Cam As TVCamera
Public Scene As TVScene
Public InputE As TVInputEngine
Public mesh As TVMesh
Public Mesh2 As TVMesh
Public scr As TVScreen2DImmediate
Public ScrText As TVScreen2DText
Public Math As TVMathLibrary


Public CamX As Single, CamY As Single, CamZ As Single
Public CamLX As Single, CamLY As Single, CamLZ As Single
'�Ӹ��Ƕ���Ϊ���ɾ�ʡȥ�˸��ӵ����Ա任
Public CamAngleX As Single, CamAngleY As Single, CamAngleZ As Single





Public Sub InitTV()
         Form1.Width = PictureWidth * Screen.TwipsPerPixelX
         Form1.Height = PictureHeight * Screen.TwipsPerPixelY
 
 
        Set TV = New TVEngine
        TV.Init3DWindowed Form1.hWnd
        TV.DisplayFPS True
        TV.SetVSync True
        'TV.SetAngleSystem TV_ANGLE_RADIAN

        Set TexF = New TVTextureFactory
        TexF.SetTextureMode TV_TEXTUREMODE_32BITS

        Set scr = New TVScreen2DImmediate
        Set ScrText = New TVScreen2DText
        ScrText.NormalFont_Create "����", "����", 16, True, False, False
        
        Set Scene = New TVScene
        Set Math = New TVMathLibrary
        Set InputE = New TVInputEngine
        InputE.Initialize True, True

        Set Cam = New TVCamera
        CamX = -10
        CamY = 0
        CamZ = 0
        CamLX = 0
        CamLY = 0
        CamLZ = 0
        CamAngleX = 0
        CamAngleY = 0
        CamAngleZ = 0
        Cam.SetCamera CamX, CamY, CamZ, CamLX, CamLY, CamLZ
        
        Set mesh = Scene.CreateMeshBuilder("Mesh")
        mesh.SetCullMode TV_DOUBLESIDED
        Set Mesh2 = Scene.CreateMeshBuilder("Mesh")
        Mesh2.SetCullMode TV_DOUBLESIDED
        Mesh2.SetColor RGBA(1, 0, 0, 0.5), False
End Sub









Public Sub �ƶ�ϵͳ()
Dim tmpMouseX As Long, tmpMouseY As Long, IsMouseLeftPressed As Boolean
Dim VF As Single, VR As Single, DeltaVConst As Single

InputE.GetMouseState tmpMouseX, tmpMouseY, IsMouseLeftPressed
If IsMouseLeftPressed = True Then '��������������
CamAngleX = CamAngleX - tmpMouseX * TV.TimeElapsed / 3000  '����ƶ� ��ͷ��ת
CamAngleY = CamAngleY - tmpMouseY * TV.TimeElapsed / 3000
End If

Select Case CamAngleY '����Ƕ�
Case Is > 1.57
CamAngleY = 1.57
Case Is < -1.57
CamAngleY = -1.57
End Select

DeltaVConst = (TV.TimeElapsed ^ 2) * 0.001
'If IsJumping = False Then '�ڿ��в��������ɵ��ƶ��� ������
   If InputE.IsKeyPressed(TV_KEY_W) = True Then
   VF = VF + DeltaVConst
   End If

   If InputE.IsKeyPressed(TV_KEY_S) = True Then
   VF = VF - DeltaVConst
   End If

   If InputE.IsKeyPressed(TV_KEY_A) = True Then
   VR = VR - DeltaVConst
   End If

   If InputE.IsKeyPressed(TV_KEY_D) = True Then
   VR = VR + DeltaVConst
   End If
'End If
'///////////////////////////////////////////////////////

Select Case VF '�����ٶ� &���ٶ�
Case Is > TV.TimeElapsed * 1.5
VF = TV.TimeElapsed * 1.5
Case Is < -TV.TimeElapsed * 1.5
VF = -TV.TimeElapsed * 1.5
Case Is > 0
VF = VF - DeltaVConst * 0.5
       If VF < 0 Then VF = 0
Case Is < 0
VF = VF + DeltaVConst * 0.5
       If VF > 0 Then VF = 0
End Select

Select Case VR '�����ٶ� &���ٶ�
Case Is > TV.TimeElapsed * 1.5
VR = TV.TimeElapsed * 1.5
Case Is < -TV.TimeElapsed * 1.5
VR = -TV.TimeElapsed * 1.5
Case Is > 0
VR = VR - DeltaVConst * 0.5
If VR < 0 Then VR = 0
Case Is < 0
VR = VR + DeltaVConst * 0.5
If VR > 0 Then VR = 0
End Select


CamX = CamX + VF * Cos(CamAngleX) + VR * Sin(CamAngleX)
CamY = CamY + VF * Sin(CamAngleY)
CamZ = CamZ + VF * Sin(CamAngleX) - VR * Cos(CamAngleX)

CamLX = CamX + 200 * Cos(CamAngleX)
CamLY = CamY + 200 * Sin(CamAngleY)
CamLZ = CamZ + 200 * Sin(CamAngleX)

'�����½�
If InputE.IsKeyPressed(TV_KEY_SPACE) Then CamY = CamY + DeltaVConst
If InputE.IsKeyPressed(TV_KEY_LEFTCONTROL) Then CamY = CamY - DeltaVConst

Cam.SetCamera CamX, CamY, CamZ, CamLX, CamLY, CamLZ
End Sub






Public Sub ��Ⱦ3D()
                        TV.clear
                        �ƶ�ϵͳ
                        scr.Draw_Line3D 0, 0, 0, 100, 0, 0, RGBA(1, 0, 0, 1) 'X��
                        scr.Draw_Line3D 0, 0, 0, 0, 100, 0, RGBA(0, 1, 0, 1) 'Y
                        scr.Draw_Line3D 0, 0, 0, 0, 0, 100, RGBA(0, 0, 1, 1) 'Z
                        
                        Select Case RenderLevel
                        Case 0
                        '����Ⱦ3D�Ļ��ͻ�drawSamplingPoint
                        Case 1
                        Scene.SetRenderMode TV_POINT
                        mesh.Render '������
                        Case 2
                        Scene.SetRenderMode TV_LINE
                         Mesh2.Render              '������
                        End Select
                        
                        
                       ' Scene.SetRenderMode TV_SOLID
                        ScrText.NormalFont_DrawText "��RIGHTSHIFT��ͼ", 20, 20, RGBA(1, 0, 0, 1), 1
                        ScrText.NormalFont_DrawText "CamX: " & CamX, 20, 50, RGBA(1, 1, 1, 1), 1
                        ScrText.NormalFont_DrawText "CamY: " & CamY, 20, 80, RGBA(1, 1, 1, 1), 1
                        ScrText.NormalFont_DrawText "CamZ: " & CamZ, 20, 110, RGBA(1, 1, 1, 1), 1
                        ScrText.NormalFont_DrawText "��Ч������: " & mesh.GetVertexCount, 20, 140, RGBA(1, 1, 1, 1), 1
                        ScrText.NormalFont_DrawText "ʵ�ʶ�����: " & Mesh2.GetVertexCount, 20, 170, RGBA(1, 1, 1, 1), 1
                        ScrText.NormalFont_DrawText "������Ƭ��: " & Mesh2.GetTriangleCount, 20, 200, RGBA(1, 1, 1, 1), 1
                        If InputE.IsKeyPressed(TV_KEY_RIGHTSHIFT) = True Then  '��ͼ
                            ScrText.NormalFont_DrawText "�ѽ�ͼ����������", 20, 230, RGBA(0, 1, 0, 1), 1
                            TV.Screenshot Form2.Text_ScrShotPath, TV_IMAGE_JPG
                            Beep
                        End If
                        TV.RenderToScreen
                        'Sleep (50)
End Sub





Public Sub �ƶ���Meshǰ()
       Dim x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu1 As Single, tv1 As Single, tu2 As Single, tv2 As Single, c As Long
       Form1.Show
       If mesh.GetVertexCount > 0 Then
       mesh.GetVertex 2, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
        CamLX = x
        CamLY = y
        CamLZ = z
        CamAngleX = 0 'Math.ATan((CamLX - CamX) / 200)
        CamAngleY = 0 'Math.ATan((CamLY - CamY) / 200)
        CamAngleZ = 0 ' Math.ATan((CamLZ - CamZ) / 200)
        CamX = CamLX - 30 * Cos(CamAngleX)
        CamY = CamLY + 30 * Sin(CamAngleY)
        CamZ = CamLZ
        Cam.SetCamera CamX, CamY, CamZ, CamLX, CamLY, CamLZ
        
        mesh.Update
        End If
        
        'Form1.SetFocus
End Sub
