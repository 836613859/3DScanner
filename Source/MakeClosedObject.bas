Attribute VB_Name = "MakeClosedObject"

Public NumOfPointVerticalLine() As Long 'ÿ�ж��ٸ��� �������ӵ�Ϊ������  ����������

Private Point3D() As TV_3DVECTOR

Public Sub MakeClosedObjectFromPointCloud()
        'Dim NumOfVerticalLines As Long '�����ٵ�����
        'NumOfVerticalLines = Val(Text_END) - Val(Text_START)
       
        DoEvents
        Dim Line1FirstPointID As Long, Line2FirstPointID As Long '�ڶ���

        Line1FirstPointID = 0
        Line2FirstPointID = Line1FirstPointID + NumOfPointVerticalLine(1)

        ReDim Point3D(mesh.GetVertexCount - 1) '��get�ö���

        Dim x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu1 As Single, tv1 As Single, tu2 As Single, tv2 As Single, c As Long
       
        'Ϊ�˷����ö�����get�ö���
        For i = 0 To mesh.GetVertexCount - 1
                mesh.GetVertex i, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
                Point3D(i).x = x
                Point3D(i).y = y
                Point3D(i).z = z
        Next i

        '
        '
        '���������������������������������������������Ρ���������������������������
        
        Dim MinOfTotalPoint As Long

        Dim p1              As Long, p2 As Long, p3 As Long

        For i = 1 To NumOfVerticalLines - 1
                MinOfTotalPoint = MIN(Val(NumOfPointVerticalLine(i)), Val(NumOfPointVerticalLine(i + 1)))  '���е�˭�ٵ�

                For j = 0 To MAX(NumOfPointVerticalLine(i), NumOfPointVerticalLine(i + 1)) - 2 'һ�ж��ٸ���

                        'ÿ������������ΪN-1��j �Ǵ�0�� N-2(Ҫ������������)
                        Select Case Val(j)

                                Case Is < MinOfTotalPoint - 1 '���ж�����˭�ĵ�����
                                        p1 = Line1FirstPointID + j
                                        p2 = Line2FirstPointID + j
                                        p3 = Line1FirstPointID + j + 1
                                        Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                        OutList.AddToList Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p3).x, Point3D(p3).y, Point3D(p3).z)
                                        
                                        p1 = Line2FirstPointID + j
                                        p2 = Line2FirstPointID + j + 1
                                        p3 = Line1FirstPointID + j + 1
                                        Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                        OutList.AddToList Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p3).x, Point3D(p3).y, Point3D(p3).z)
                                                                          
                                Case Is > MinOfTotalPoint '��Ӧ�����굽������ĵ��� ע���±��ж��Ǵ��ں�

                                        If NumOfPointVerticalLine(i) > NumOfPointVerticalLine(i + 1) Then
                                                '��һ�еĵ���ʱ��
                                                p1 = Line1FirstPointID + j - 1
                                                p2 = Line2FirstPointID + MinOfTotalPoint - 1 '�ڶ�����͵�������
                                                p3 = Line1FirstPointID + j
                                        Else
                                                p1 = Line1FirstPointID + MinOfTotalPoint - 1 '��һ����͵�
                                                p2 = Line2FirstPointID + j - 1 '�ٵ��������͵�������
                                                p3 = Line2FirstPointID + j
                                        End If

                                        Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                        OutList.AddToList Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p3).x, Point3D(p3).y, Point3D(p3).z)
                        End Select

                Next j
                
                '�ⶥ����
                If Line2FirstPointID < mesh.GetVertexCount Then
                        p1 = Line1FirstPointID
                        p2 = Line2FirstPointID
                        Mesh2.AddTriangle 0, TopPoint.x, TopPoint.y, TopPoint.z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z
                        OutList.AddToList Vector3(TopPoint.x, TopPoint.y, TopPoint.z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z)
       
                        p1 = Line1FirstPointID + NumOfPointVerticalLine(i) - 1
                        p2 = Line2FirstPointID + NumOfPointVerticalLine(i + 1) - 1
                        Mesh2.AddTriangle 0, BottomPoint.x, BottomPoint.y, BottomPoint.z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z
                        OutList.AddToList Vector3(BottomPoint.x, BottomPoint.y, BottomPoint.z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z)
       
                End If
       
                '�������
                Line1FirstPointID = Line2FirstPointID '�������ڴ����� ��i�и��µ�i+1
                Line2FirstPointID = Line2FirstPointID + NumOfPointVerticalLine(i + 1) 'i+1���µ�i+2

        Next i

        '�������������������������һ�к͵�һ������������������������

        '�������һ�к͵�һ��������
        Line1FirstPointID = mesh.GetVertexCount - NumOfPointVerticalLine(NumOfVerticalLines)  '���һ��
        Line2FirstPointID = 0 '��һ��

        For j = 0 To MAX(NumOfPointVerticalLine(NumOfVerticalLines), NumOfPointVerticalLine(1)) - 2
                MinOfTotalPoint = MIN(Val(NumOfPointVerticalLine(NumOfVerticalLines)), Val(NumOfPointVerticalLine(1)))

                Select Case Val(j)

                        Case Is < MinOfTotalPoint - 1 '
                                p1 = Line1FirstPointID + j '|/
                                p2 = Line2FirstPointID + j
                                p3 = Line1FirstPointID + j + 1
                                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                OutList.AddToList Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p3).x, Point3D(p3).y, Point3D(p3).z)
                                                               
                                p1 = Line2FirstPointID + j
                                p2 = Line2FirstPointID + j + 1
                                p3 = Line1FirstPointID + j + 1
                                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                OutList.AddToList Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p3).x, Point3D(p3).y, Point3D(p3).z)
                                                               
                        Case Is > MIN(Val(NumOfPointVerticalLine(i)), Val(NumOfPointVerticalLine(1)))

                                If NumOfPointVerticalLine(i) > NumOfPointVerticalLine(1) Then
                                        '��һ�еĵ���ʱ��
                                        p1 = Line1FirstPointID + j - 1
                                        p2 = Line2FirstPointID + MinOfTotalPoint - 1 '�ڶ�����͵�������
                                        p3 = Line1FirstPointID + j
                                Else
                                        p1 = Line1FirstPointID + MinOfTotalPoint - 1 '��һ����͵�
                                        p2 = Line2FirstPointID + j - 1 '�ٵ��������͵�������
                                        p3 = Line2FirstPointID + j
                                End If
                                
                                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                End Select
              
        Next j

        'Ҫ˳ʱ�����ɶ��� ���߲�����ȷ
        p1 = Line1FirstPointID
        p2 = Line2FirstPointID
        Mesh2.AddTriangle 0, TopPoint.x, TopPoint.y, TopPoint.z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z
        OutList.AddToList Vector3(TopPoint.x, TopPoint.y, TopPoint.z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z)
        
        p1 = Line1FirstPointID + NumOfPointVerticalLine(i) - 1
        p2 = Line2FirstPointID + NumOfPointVerticalLine(1) - 1
        Mesh2.AddTriangle 0, BottomPoint.x, BottomPoint.y, BottomPoint.z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z
        OutList.AddToList Vector3(BottomPoint.x, BottomPoint.y, BottomPoint.z), Vector3(Point3D(p2).x, Point3D(p2).y, Point3D(p2).z), Vector3(Point3D(p1).x, Point3D(p1).y, Point3D(p1).z)
        '
        '
        '������������������������������������������������������������������������������������������������
        Mesh2.WeldVertices 0
End Sub

