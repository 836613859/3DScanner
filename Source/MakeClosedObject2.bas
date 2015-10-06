Attribute VB_Name = "MakeClosedObject2"
Private VLineFirstPointID() As Long
Private VLineLastPointID() As Long




Public Sub MakeClosedObjectFromPointCloud()
       
        DoEvents
        
        ReDim VLineFirstPointID(1 To NumOfVerticalLines)
        ReDim VLineLastPointID(1 To NumOfVerticalLines)
        ReDim Point3D(mesh.GetVertexCount - 1) '��get�ö���
       
        Dim x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu1 As Single, tv1 As Single, tu2 As Single, tv2 As Single, c As Long

        'Ϊ�˷����ö�����get�ö���
        For i = 0 To mesh.GetVertexCount - 1
                mesh.GetVertex i, x, y, z, nx, ny, nz, tu1, tv1, tu2, tv2, c
                Point3D(i).x = x
                Point3D(i).y = y
                Point3D(i).z = z
        Next i
        
        Dim Line1FirstPointID As Long, Line2FirstPointID As Long '�ڶ���

        Line1FirstPointID = 0
        Line2FirstPointID = Line1FirstPointID + NumOfPointVerticalLine(1)

        '
        '
        '���������������������������������������������Ρ���������������������������
        
        Dim MinOfTotalPoint As Long

        Dim p1              As Long, p2 As Long, p3 As Long

        For i = 1 To NumOfVerticalLines
                MinOfTotalPoint = MIN(Val(NumOfPointVerticalLine(i)), Val(NumOfPointVerticalLine(i + 1)))  '���е�˭�ٵ�

                For j = 0 To MAX(NumOfPointVerticalLine(i), NumOfPointVerticalLine(i + 1)) - 1

                        'ÿ������������ΪN-1��j �Ǵ�0�� N-2(Ҫ������������)
                        Select Case Val(j)

                                Case Is < MinOfTotalPoint - 1 '���ж�����˭�ĵ�����
                                        p1 = Line1FirstPointID
                                        p2 = Line2FirstPointID + j
                                        p3 = Line1FirstPointID + j + 1
                                        Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                        OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
                                        
                                        p1 = Line2FirstPointID + j
                                        p2 = Line2FirstPointID + j + 1
                                        p3 = Line1FirstPointID + j + 1
                                        Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                                        OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
                                        
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
                                        OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
                        End Select

                Next j
                
                '�������
                VLineFirstPointID(i) = Line1FirstPointID
                VLineLastPointID(i) = Line2FirstPointID - 1
                Line1FirstPointID = Line2FirstPointID '�������ڴ����� ��i�и��µ�i+1
                Line2FirstPointID = Line2FirstPointID + NumOfPointVerticalLine(i + 1) 'i+1���µ�i+2
                
        Next i
       
       
       
        '���������������������ⶥ���ס���������������������������
        For i = 1 To Int((NumOfVerticalLines - 1) / 2) - 1 'int������ȡ��  ע�⣺��һ�к����һ�����ص��ģ����Լ�1
                '������
                p1 = VLineFirstPointID(i)
                p2 = VLineFirstPointID(NumOfVerticalLines - i + 1)
                p3 = VLineFirstPointID(NumOfVerticalLines - i)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
        
                p1 = VLineFirstPointID(i)
                p2 = VLineFirstPointID(i + 1)
                p3 = VLineFirstPointID(NumOfVerticalLines - i)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p2), Point3D(p1), Point3D(p3)
       
                '������
                p1 = VLineLastPointID(i)
                p2 = VLineLastPointID(NumOfVerticalLines - i + 1)
                p3 = VLineLastPointID(NumOfVerticalLines - i)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p2), Point3D(p1), Point3D(p3)
        
                p1 = VLineLastPointID(i)
                p2 = VLineLastPointID(i + 1)
                p3 = VLineLastPointID(NumOfVerticalLines - i)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3) '����˳���Ǹ���UP�����ָʾ������= =
        
        Next i
        
        
        
        If Int(NumOfVerticalLines - 1 / 2) Mod 2 = 1 Then '��ȥ���һ������������
                p1 = VLineFirstPointID(Int((NumOfVerticalLines) / 2))  '��Ȧǰ�����һ����
                p2 = VLineFirstPointID(Int((NumOfVerticalLines) / 2) + 1)
                p3 = VLineFirstPointID(Int((NumOfVerticalLines) / 2) + 2)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
        
                p1 = VLineLastPointID(Int((NumOfVerticalLines) / 2))  '��Ȧǰ�����һ����
                p2 = VLineLastPointID(Int((NumOfVerticalLines) / 2) + 1)
                p3 = VLineLastPointID(Int((NumOfVerticalLines) / 2) + 2)
                Mesh2.AddTriangle 0, Point3D(p1).x, Point3D(p1).y, Point3D(p1).z, Point3D(p2).x, Point3D(p2).y, Point3D(p2).z, Point3D(p3).x, Point3D(p3).y, Point3D(p3).z
                OutList.AddToList Point3D(p1), Point3D(p2), Point3D(p3)
        End If

        '������������������������������������������������������������������������������������������������
        
        Mesh2.WeldVertices 0
        
End Sub

