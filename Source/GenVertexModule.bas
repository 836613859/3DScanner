Attribute VB_Name = "cGenVertexModule"
'Public TopPoint As TV_3DVECTOR, BottomPoint As TV_3DVECTOR '�ⶥ ��׵�



Private MatrixTrans As TV_3DMATRIX
Private MatrixLocal As TV_3DMATRIX
Private MatrixWorld As TV_3DMATRIX

Private VectorWorldOffset As TV_3DVECTOR '
Private VectorStart As TV_3DVECTOR '����������������

Public Sub GenerateVertex(ProcessingPictureID As Long, ProcessingPixelY As Long)

        Dim LocalX As Single, LocalY As Single, LocalZ As Single

        Dim x             As Single, y As Single, z As Single, RealPictureH As Single, DEPTH As Single

        Dim d             As Single, cita As Single, LightDistance As Single, TurnCenterToWall As Single

        Dim NumOfPictures As Long '��Ƭ��
        
        Dim ProcessingAngle As Single '���ڴ�����Ƭ�ĽǶ�


        PictureStartID = Val(Form2.Text_START)
        d = CamParam1.StandardLength '��׼���
        cita = CamParam1.VisibleAngleVertical '���¿��ӽ�
        NumOfPictures = Val(Form2.Text_END - Form2.Text_START + 1)
        TurnCenterToWall = Val(Form2.Text_CenterToWall) '�ؼ�
        RealPictureH = d * Tan(0.5 * cita) * 2    '���������ֱ��Χ��ʵ�ʳ���  ���Ǹ�z�����й�����..z��Ӱ��y���ƫ�� �ӽ�����
        DEPTH = GetDepthFromOffset(CamParam1, SamplingPx(ProcessingPixelY), Side_Left)
        
        
       'x = ��� - �п�һ��
        LocalX = TurnCenterToWall - DEPTH
        
        LocalZ = 0 'CamToLight
        ' y = WorldY ����Ҫ�任
        LocalY = -RealPictureH * ((ProcessingPixelY / PictureHeight) + DEPTH / (2 * d) - (DEPTH * ProcessingPixelY) / (d * PictureHeight)) '�ϰ�ι�ʽ
        'Else���°�ι�ʽһ��
        'y = -RealPictureH * ((ProcessingPixelY / PictureHeight) + z / (2 * d) - (z * ProcessingPixelY) / (d * PictureHeight))
        'End If
        

        With MatrixLocal '�ֲ����� ���õ�һ����
                .m11 = LocalX
                .m21 = LocalY
                .m31 = LocalZ
        End With
        
       '���ڴ����ͼƬ��������Ƕ�(����ͼ)
       ProcessingAngle = 2 * 3.1415926 * (ProcessingPictureID - Val(Form2.Text_START)) / NumOfPictures
       
       With MatrixTrans '�任���� ��ʵ�Ǹ�ʽ��4X4�Ĳ�����3X3����
              .m11 = Cos(ProcessingAngle)
              .m12 = 0
              .m13 = -Sin(ProcessingAngle)
              .m21 = 0
              .m22 = 1
              .m23 = 0
              .m31 = Sin(ProcessingAngle)
              .m32 = 0
              .m33 = Cos(ProcessingAngle)
       End With

       Math.TVMatrixMultiply MatrixWorld, MatrixTrans, MatrixLocal  'Local����任
       
       x = MatrixWorld.m11
       y = MatrixWorld.m21
       z = MatrixWorld.m31


       mesh.AddVertex x, y + RealPictureH / 2, z, -Cos(ProcessingAngle), 0, -Sin(ProcessingAngle), 0, 0 '��������

End Sub




'Public Sub GenerateTopAndBottomCenterPoint() '���ڷⶥ�ͷ��
'        Dim x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu1 As Single, tv1 As Single, tu2 As Single, tv2 As Single, c As Long
 '      Dim LineFirstPointID As Long, LineLastPointID As Long
'
'       LineFirstPointID = 0
'       LineLastPointID = NumOfPointVerticalLine(1) - 1
''       For i = 1 To NumOfVerticalLines
'       mesh.GetVertex LineFirstPointID, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
 '      TopPoint.y = TopPoint.y + y
 '      mesh.GetVertex LineLastPointID, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
 '      BottomPoint.y = BottomPoint.y + y
'       '���´���ID
 '      LineFirstPointID = LineLastPointID + 1 '
 '      LineLastPointID = LineLastPointID + NumOfPointVerticalLine(i + 1) '������󶥵�ID+���ж�����
 '      Next i
'
'TopPoint = Vector3(0, TopPoint.y / NumOfVerticalLines, 0) '�ⶥ��
'BottomPoint = Vector3(0, BottomPoint.y / NumOfVerticalLines, 0) '��׵�

'End Sub






