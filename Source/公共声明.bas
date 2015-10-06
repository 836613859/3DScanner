Attribute VB_Name = "��������������"
'������������������������API����������������������������
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'������������������������Constant��������������������
Public Const PictureWidth = 640
Public Const PictureHeight = 480

'������������������������Var����������������
Public RenderLevel As Integer

Public NumOfVerticalLines As Long '��������

Public NumOfPointVerticalLine() As Long 'ÿ�ж��ٸ��� �������ӵ�Ϊ������  ����������

Public Point3D() As TV_3DVECTOR


'������������������������Type������������������������
Public Type CameraParameters

        VisibleAngleHorizontal As Single '���ӽǦȺ�
        VisibleAngleVertical As Single '���ӽǦ���
        StandardLength As Single '��׼��� ���㵽������
        CamToLight As Single '��ͷ�����ߵľ���

End Type

'������������������������Enum������������������������

Public Enum LightSideType
       Side_Left = 0
        Side_Right = 1
End Enum

Public Enum SaveFileType
FILE_STL = 0
FILE_ASC_POINT_CLOUD = 1
End Enum



Public Sub ������������Init������������()
       'Set OutList = New OutputTriangleList
        CamParam1.StandardLength = Val(Form2.Text1) 'mm
        CamParam1.VisibleAngleHorizontal = (Form2.Text2 / 360) * 2 * 3.1415926
        CamParam1.VisibleAngleVertical = (Form2.Text6 / 360) * 2 * 3.1415926
        CamParam1.CamToLight = Form2.Text3


        'PictureWidth = 480 '����ͼƬ�ĳߴ磨���أ�
        'PictureHeight = 320
        
        InitTV
       
       Form2.Show
       Form1.Show '��Ⱦ�� ��������ѭ��
End Sub





Public Sub SavePointCloud()
        Dim x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu1 As Single, tv1 As Single, tu2 As Single, tv2 As Single, c As Long
        Open App.Path & "\Output.txt" For Append As #2
        For a = 0 To mesh.GetVertexCount - 1
                mesh.GetVertex a, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
                Print #2, x; "," & y & "," & z
        Next a
        Close #2
       
       Form2.List1.AddItem "����������..."
        MsgBox "ASCII���ƴ�����ɣ�", vbInformation
End Sub

Public Sub SaveSTL()
Dim FileStart As String * 80
Dim TotalTriangles As Long '
Dim TriangleEnd As String * 2
Dim Normal As TV_3DVECTOR, v1 As TV_3DVECTOR, v2 As TV_3DVECTOR

FileStart = "Solid OBJECT1"
TotalTriangles = Mesh2.GetTriangleCount

If Dir(App.Path & "\Output.stl") <> "" Then Kill App.Path & "\Output.stl"
Open App.Path & "\Output.stl" For Binary As #1
Put #1, , FileStart '�ļ�ͷ 80�ֽ�
Put #1, , TotalTriangles '�������� 4�ֽ�
For i = 1 To OutList.GetUpperBound
       v1 = Math.VSubtract(OutList.GetVertex(i, 2), OutList.GetVertex(i, 1))
       v2 = Math.VSubtract(OutList.GetVertex(i, 3), OutList.GetVertex(i, 1))
       Normal = Math.VCrossProduct(v1, v2) '������
       Put #1, , Normal.x 'UP�����XZY
       Put #1, , Normal.z
       Put #1, , Normal.y
       Put #1, , OutList.GetVertex(i, 2).x
       Put #1, , OutList.GetVertex(i, 2).z
       Put #1, , OutList.GetVertex(i, 2).y
       Put #1, , OutList.GetVertex(i, 1).x
       Put #1, , OutList.GetVertex(i, 1).z
       Put #1, , OutList.GetVertex(i, 1).y
       Put #1, , OutList.GetVertex(i, 3).x
       Put #1, , OutList.GetVertex(i, 3).z
       Put #1, , OutList.GetVertex(i, 3).y
       Put #1, , TriangleEnd 'ÿ�������ε�ĩβ 2�ֽ�
Next i
Close #1

Form2.List1.AddItem "stl�������..."
MsgBox ".stl�ļ�������ɣ�", vbInformation
End Sub






Public Function MIN(Value1 As Single, Value2 As Single) As Single

If Value1 <= Value2 Then
MIN = Value1
Else
MIN = Value2
End If

End Function


Public Function MAX(Value1 As Variant, Value2 As Variant) As Single

If Value1 >= Value2 Then
MAX = Value1
Else
MAX = Value2
End If

End Function



Public Function GetPointID(iVerticalLine As Long, HorizontalID As Long) As Long '���������ڱ������Ա�
Dim ID As Long
'iVerticalLine �� 1 to N
If iVerticalLine > 1 Then
For i = 1 To iVerticalLine - 1 '-1����Ϊ���ü��ϵ�ǰ�еĵ���
ID = ID + NumOfPointVerticalLine(i)
Next i
End If

GetPointID = ID + HorizontalID - 1 'TV3D��MESH ����ID��0��ʼ
End Function
