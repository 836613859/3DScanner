VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "3Dɨ�� V1.12 - ��������"
   ClientHeight    =   8295
   ClientLeft      =   45
   ClientTop       =   675
   ClientWidth     =   8010
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8295
   ScaleWidth      =   8010
   StartUpPosition =   2  '��Ļ����
   Begin VB.CommandButton Command_������� 
      Caption         =   "�������"
      Enabled         =   0   'False
      Height          =   735
      Left            =   2520
      TabIndex        =   40
      Top             =   6960
      Width           =   855
   End
   Begin VB.TextBox Text_IdenLine 
      Height          =   270
      Left            =   360
      TabIndex        =   39
      Text            =   "40"
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton Command_����ϸ�� 
      Caption         =   "����ϸ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2520
      TabIndex        =   37
      Top             =   4800
      Width           =   1935
   End
   Begin VB.CommandButton Command_ȡ�����ɶ��� 
      Caption         =   "��������ȡ��"
      Height          =   735
      Left            =   5400
      TabIndex        =   36
      Top             =   6960
      Width           =   1815
   End
   Begin VB.CommandButton Command_������� 
      Caption         =   "�������"
      Enabled         =   0   'False
      Height          =   855
      Left            =   2520
      TabIndex        =   35
      Top             =   6000
      Width           =   855
   End
   Begin VB.CommandButton Command_��� 
      Caption         =   "���"
      Height          =   420
      Left            =   2520
      TabIndex        =   34
      Top             =   2400
      Width           =   1935
   End
   Begin VB.TextBox Text_Bezier 
      Height          =   270
      Left            =   360
      TabIndex        =   33
      Text            =   "2"
      Top             =   7320
      Width           =   1575
   End
   Begin VB.CommandButton Command_Bezier 
      Caption         =   "Bezier����ƽ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2520
      TabIndex        =   31
      Top             =   3600
      Width           =   1935
   End
   Begin VB.TextBox Text_ScrShotPath 
      Height          =   270
      Left            =   360
      TabIndex        =   29
      Text            =   "d:\1.jpg"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton Command_�����ع� 
      Caption         =   "�����ع�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2520
      TabIndex        =   28
      Top             =   4200
      Width           =   1935
   End
   Begin VB.CommandButton Command_��������� 
      Caption         =   "���������"
      Enabled         =   0   'False
      Height          =   855
      Left            =   3600
      TabIndex        =   27
      Top             =   6000
      Width           =   855
   End
   Begin VB.TextBox Text_CenterToWall 
      Height          =   270
      Left            =   360
      TabIndex        =   26
      Text            =   "0"
      Top             =   6000
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Caption         =   "��Ⱦ״̬"
      Height          =   1935
      Left            =   2400
      TabIndex        =   21
      Top             =   360
      Width           =   2055
      Begin VB.OptionButton Option1 
         Caption         =   "������Ⱦ"
         Height          =   180
         Left            =   120
         TabIndex        =   24
         Top             =   480
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.OptionButton Option2 
         Caption         =   "3D�պ�����Ⱦ"
         Height          =   300
         Left            =   120
         TabIndex        =   23
         Top             =   1080
         Width           =   1575
      End
      Begin VB.OptionButton Option3 
         Caption         =   "3D������Ⱦ"
         Height          =   375
         Left            =   120
         TabIndex        =   22
         Top             =   720
         Width           =   1575
      End
   End
   Begin VB.CommandButton Command_����STL 
      Caption         =   "����STL"
      Enabled         =   0   'False
      Height          =   720
      Left            =   3600
      TabIndex        =   20
      Top             =   6960
      Width           =   855
   End
   Begin VB.TextBox Text_LowerBound 
      Height          =   270
      Left            =   360
      TabIndex        =   19
      Text            =   "0.2"
      Top             =   6720
      Width           =   1575
   End
   Begin VB.TextBox Text6 
      Height          =   270
      Left            =   360
      TabIndex        =   17
      Text            =   "46.8"
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox Text7 
      Height          =   270
      Left            =   360
      TabIndex        =   15
      Text            =   ".png"
      Top             =   5280
      Width           =   1455
   End
   Begin VB.TextBox Text_END 
      Height          =   270
      Left            =   360
      TabIndex        =   13
      Text            =   "99"
      Top             =   4680
      Width           =   1455
   End
   Begin VB.TextBox Text_START 
      Height          =   270
      Left            =   360
      TabIndex        =   12
      Text            =   "10"
      Top             =   4320
      Width           =   1455
   End
   Begin VB.TextBox Text4 
      Height          =   270
      Left            =   360
      TabIndex        =   10
      Text            =   "00"
      Top             =   3720
      Width           =   1455
   End
   Begin VB.ListBox List1 
      Height          =   6060
      IntegralHeight  =   0   'False
      ItemData        =   "Form2.frx":0000
      Left            =   4920
      List            =   "Form2.frx":0007
      TabIndex        =   7
      Top             =   720
      Width           =   2775
   End
   Begin VB.CommandButton Command_���ɵ��� 
      Caption         =   "���ɵ���"
      Height          =   375
      Left            =   2520
      TabIndex        =   6
      Top             =   3000
      Width           =   1935
   End
   Begin VB.TextBox Text3 
      Height          =   270
      Left            =   360
      TabIndex        =   5
      Text            =   "20"
      Top             =   2400
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      Height          =   270
      Left            =   360
      TabIndex        =   3
      Text            =   "60"
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   270
      Left            =   360
      TabIndex        =   0
      Text            =   "65"
      Top             =   600
      Width           =   1455
   End
   Begin VB.Label Label11 
      Caption         =   "��ʶ�����α߳�(mm):"
      Height          =   255
      Left            =   240
      TabIndex        =   38
      Top             =   2760
      Width           =   1815
   End
   Begin VB.Label Label14 
      Caption         =   "Bezier����������"
      Height          =   255
      Left            =   360
      TabIndex        =   32
      Top             =   7080
      Width           =   1575
   End
   Begin VB.Label Label9 
      Caption         =   "��ͼ����·����"
      Height          =   255
      Left            =   360
      TabIndex        =   30
      Top             =   7680
      Width           =   1575
   End
   Begin VB.Label Label8 
      Caption         =   "���ĵ��װ�(mm):"
      Height          =   255
      Left            =   360
      TabIndex        =   25
      Top             =   5760
      Width           =   1695
   End
   Begin VB.Label Label12 
      Caption         =   "��ɫɸѡ�½�(0-1)��"
      Height          =   255
      Left            =   240
      TabIndex        =   18
      Top             =   6480
      Width           =   1815
   End
   Begin VB.Label Label10 
      Caption         =   "��ͷ���ӽ���(�Ƕ�)��"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   1560
      Width           =   1815
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      X1              =   2160
      X2              =   2160
      Y1              =   120
      Y2              =   7920
   End
   Begin VB.Label Label7 
      Caption         =   "��Ƭ��׺��"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   5040
      Width           =   1095
   End
   Begin VB.Label Label6 
      Caption         =   "��Ƭǰ׺��"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "��Ƭ��ſ�ȣ�"
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   4080
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "״̬����"
      Height          =   255
      Left            =   4920
      TabIndex        =   8
      Top             =   360
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "CamToLight(mm):"
      Height          =   255
      Left            =   360
      TabIndex        =   4
      Top             =   2160
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "��ͷ���ӽǺ�(�Ƕ�)��"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "��׼���(mm)��"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   360
      Width           =   1455
   End
   Begin VB.Menu Menu_�ļ� 
      Caption         =   "�ļ�.."
      Begin VB.Menu Menu_�����ļ� 
         Caption         =   "����tvm�ļ�������"
      End
   End
   Begin VB.Menu Menu_Ӳ�� 
      Caption         =   "Ӳ��.."
      Begin VB.Menu Menu_���� 
         Caption         =   "��ʱ���տ�ʼ..."
      End
   End
   Begin VB.Menu Menu_Ԥ������ 
      Caption         =   "Ԥ������.."
      Begin VB.Menu Ԥ��_ԭ�ͻ����� 
         Caption         =   "����1100D&ԭ�ͻ�����"
      End
      Begin VB.Menu Ԥ��_3DMAXԲ���� 
         Caption         =   "3DMAXģ��_Բ����ɨ�����"
      End
      Begin VB.Menu Ԥ��_3DMAXɢ�� 
         Caption         =   "3DMAXģ��_ɢ�ҵ���ɨ�����"
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Private PipeLine As Scan3DProcessingPipeLine
Private Pipeline2 As Scan3DProcessingPipeline2
Private Scene As Scan3DScene
Private Prepare As Scan3DPreparation
Private ScanPARAM As Type_ScanParameters
Private RENDERLEVEL As Integer
Private CancelGeneration As Boolean



Private Sub Command_���_Click()
'MsgBox Hardware.InitSerialPort(5, True)
Command_���ɵ���.Enabled = True
Prepare.AnalyzeIdentificationPoint
ScanPARAM.StandardDepth = Prepare.GetStandardDepth
ScanPARAM.VisibleAngleHorizontal = Prepare.GetVisibleAngleHorizontal
ScanPARAM.VisibleAngleVertical = Prepare.GetVisibleAngleVertical
Text1 = ScanPARAM.StandardDepth
Text2 = ScanPARAM.VisibleAngleHorizontal
Text6 = ScanPARAM.VisibleAngleVertical
End Sub


Private Sub Command_�������_Click()
Pipeline2.ClearMainMeshBuffer
Pipeline2.ResetRenderMesh
Pipeline2.AddPointCloudToRenderMesh
End Sub

Private Sub Command_ȡ�����ɶ���_Click() 'ȡ�����ɶ���
CancelGeneration = True
List1.AddItem "��������ȡ��......."
End Sub


Private Sub Form_Load()
       'PictureWidth = 1920
       'PictureHeight = 1280
       Form1.Show
       
       Set Pipeline2 = New Scan3DProcessingPipeline2
       Set Scene = New Scan3DScene
       Set Prepare = New Scan3DPreparation

        '����������������������ʼ������������������������

       ScanPARAM.CamToLight = Val(Text3)
       ScanPARAM.StandardDepth = Val(Text1)
       ScanPARAM.VisibleAngleVertical = Val(Text6)
       ScanPARAM.VisibleAngleHorizontal = Val(Text2)
       ScanPARAM.ColorFilter = Val(Text_LowerBound)
       ScanPARAM.IdentificationLineLength = Val(Text_IdenLine)
        '������������������������������������������������
       Me.Show
       Scene.Init 320, 240, 640, 480, Form1.hWnd
       'Form1.Width = 720 * Screen.TwipsPerPixelX '��Ⱦ���ڴ�С�̶�
       'Form1.Height = 480 * Screen.TwipsPerPixelY
       'Scene.ResizeRenderWindow
       
Do
DoEvents
Select Case RENDERLEVEL
Case 1
Scene.SimulateMovement
Scene.Render3D RENDER_POINTCLOUD
Case 2
Scene.SimulateMovement
Scene.Render3D RENDER_MESHLINE
End Select
Loop

End Sub




Private Sub Command_���ɵ���_Click() '���ɶ���
        ScanPARAM.CamToLight = Val(Text3)
        ScanPARAM.StandardDepth = Val(Text1)
        ScanPARAM.VisibleAngleVertical = Val(Text6)
        ScanPARAM.VisibleAngleHorizontal = Val(Text2)
        ScanPARAM.ColorFilter = Val(Text_LowerBound)
        ScanPARAM.IdentificationLineLength = Val(Text_IdenLine)
       Pipeline2.SetScanParameters ScanPARAM
       
        Option1.Value = True '������Ⱦ
        List1.Clear

        '��������������������������ˮ�ߡ���������������������������
 
        List1.AddItem "��ʼ�����..."
        List1.Refresh

        Dim LPath As String, PStart As Long, PEnd As Long, prefix As String, suffix As String
        PStart = Val(Text_START)
        PEnd = Val(Text_END)
        prefix = Text4
        suffix = Text7
        '�ж�����ͼ
       Pipeline2.SetPictureCount PEnd - PStart + 1
       
       Dim i As Long
        For i = PStart To PEnd '����ͼƬ & ����
        DoEvents
                LPath = App.Path & "\Group\" & prefix & CStr(i) & suffix
                If Dir(LPath) = "" Then GoTo Err: '·�������ھ͵������
                If CancelGeneration = True Then
                Pipeline2.ClearMainBuffer
                Pipeline2.ClearPictureBuffer
                CancelGeneration = False
                GoTo ex:
                End If
                
                Pipeline2.LoadScanPicture LPath, i - PStart + 1
                
                '�������MB��
                Pipeline2.SampleFromPicture Side_Left, i - PStart + 1
                
                '�����������Ĳ�����ת�ǣ�
                '����̫������û�и�
                Pipeline2.SetScanCameraPerPicture i - PStart + 1, Vector3(0, 0, 0), , , , -3.1415926 * 3 / 18, 0, 0
                
                '����ͼƬ�ı�ʶ�����μ���cam�����EulerY
                Pipeline2.ComputeCamPosAndAngleY i - PStart + 1
                
                Scene.RenderSampling i - PStart + 1, RGBA(0, 1, 0, 1)
                
                List1.AddItem "����ͼƬ���.." & i
                List1.ListIndex = List1.ListCount - 1
        Next i
        
        
        List1.AddItem "ͼƬ�������...."
        Pipeline2.Generate3DPointCloud Side_Left, Matrix_Euler '���ɶ���
        Pipeline2.AddPointCloudToRenderMesh
        Pipeline2.WeldVertices_RenderMesh
        '����������������������������������������������������
        'PipeLine.ClearPictureBuffer
        List1.AddItem "���񶥵���: " & Pipeline2.GetMainBuffer.GetPointAmount '������Ϣ
        List1.ListIndex = List1.ListCount - 1
        Command_�������.Enabled = True
        Command_���������.Enabled = True
        Command_�����ع�.Enabled = True
        Command_Bezier.Enabled = True
        Command_�������.Enabled = True
        Beep
        Option3.Value = True
        Scene.MoveAndLookatMesh
        Command_���ɵ���.Enabled = False


        GoTo ex:
        '������������ͼƬ����Ĵ���������
Err:
        MsgBox "ͼƬ·�������ڣ���", vbCritical
        '��������������������������������
ex:

End Sub




Private Sub Command_����STL_Click() '�����ļ�
If MsgBox("�Ƿ񱣴�STL??", vbYesNo, "�����ļ�") = vbYes Then
Pipeline2.SaveSTL "OBJECT1", App.Path & "\OUTPUT.STL", True
MsgBox "������ɣ�", vbOKOnly, "��ɣ�"
List1.AddItem "STL�ļ��������..."
List1.ListIndex = List1.ListCount - 1
End If
Beep
End Sub


Private Sub Command_�������_Click()
If MsgBox("�Ƿ񱣴�ASCII����??", vbYesNo, "�����ļ�") = vbYes Then
Pipeline2.SaveAsciiPointCloud App.Path & "\OUTPUT.txt", True
List1.AddItem "ASCII���Ʊ������..."
List1.ListIndex = List1.ListCount - 1
MsgBox "������ɣ�", vbOKOnly, "��ɣ�"
End If
Beep
End Sub


Private Sub Command_���������_Click() '���
Pipeline2.ClearMainBuffer
Pipeline2.ClearPictureBuffer
Command_���ɵ���.Enabled = True
Command_�����ع�.Enabled = False
Command_����STL.Enabled = False
Command_ȡ�����ɶ���.Enabled = False
Command_�������.Enabled = False
Command_Bezier.Enabled = False
Command_�������.Enabled = False
End Sub



Private Sub Command_�����ع�_Click() '�պ���
List1.AddItem "��ʼ������������Ƭ..."
Pipeline2.MeshReconstruction RC_MappedBall
Pipeline2.AddTriangleToRenderMesh
List1.AddItem "���..."
List1.ListIndex = List1.ListCount - 1
Option2.Value = True
RENDERLEVEL = 2
Command_����STL.Enabled = True '�����ļ�
Command_Bezier.Enabled = False 'BEZIER
Command_�����ع�.Enabled = False
Command_�������.Enabled = False '�������
End Sub





Private Sub Menu_�����ļ�_Click()

       ScanPARAM.CamToLight = Val(Text3)
        ScanPARAM.StandardDepth = Val(Text1)
        'ScanPARAM.TurningCenterToWall = Val(Text_CenterToWall)
        ScanPARAM.VisibleAngleVertical = Val(Text6)
        ScanPARAM.VisibleAngleHorizontal = Val(Text2)
       ScanPARAM.ColorFilter = Val(Text_LowerBound)
      Pipeline2.SetScanParameters ScanPARAM
       Pipeline2.LoadtvmToPointCloud App.Path & "\Mesh\1.tvm"
       Scene.MoveAndLookatMesh
       Option3.Value = True '������Ⱦ
       Command_���.Enabled = False
       Command_���ɵ���.Enabled = False
      Command_�������.Enabled = True
      Command_���������.Enabled = True
       Command_Bezier.Enabled = True
       Command_�����ع�.Enabled = True
End Sub

Private Sub Menu_����_Click()
Prepare.InitSerialPort 0, True
Prepare.TakePhoto_START
Pipeline2.AppSleep (60000)
Prepare.TakePhoto_END
End Sub

Private Sub Option1_Click()
RENDERLEVEL = 0 '����
End Sub

Private Sub Option2_Click()
RENDERLEVEL = 2 '�պ���
End Sub

Private Sub Option3_Click() '3D��Ⱦ
RENDERLEVEL = 1 '����
End Sub







Private Sub Form_Unload(Cancel As Integer)
Set Pipeline2 = Nothing
Set Scene = Nothing
End
End Sub



Private Sub Ԥ��_3DMAXɢ��_Click()
Text1 = "65" 'standardlength
Text2 = "60" '��
Text6 = "46.8" '����
Text3 = "20" 'camtolight
Text4 = "00" 'ǰ׺
Text_START = "10"
Text_END = "99"
Text7 = ".png"
Text_LowerBound = "0.2"
Text_IdenLine = "20"
End Sub

Private Sub Ԥ��_3DMAXԲ����_Click()
Text1 = "65" 'standardlength
Text2 = "90" '��
Text6 = "73.4" '����
Text3 = "20" 'camtolight
Text4 = "00" 'ǰ׺
Text_START = "10"
Text_END = "99"
Text7 = ".png"
Text_CenterToWall = "0"
Text_LowerBound = "0.17"
End Sub

Private Sub Ԥ��_ԭ�ͻ�����_Click()
Text1 = "" 'standardlength
Text2 = "" '��
Text6 = "" '����
Text3 = "95" 'camtolight
Text4 = "IMG_" 'ǰ׺
Text_START = "5619"
Text_END = "5779"
Text7 = ".JPG"
Text_CenterToWall = "0"
Text_LowerBound = "0.6"
End Sub
