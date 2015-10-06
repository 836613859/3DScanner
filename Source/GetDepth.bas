Attribute VB_Name = "bGetDepth"
'Public Point3D() As TV_3DVECTOR
Public CamParam1 As CameraParameters '�������





Public Function GetDepthFromOffset(CamParam As CameraParameters, _
                                   OffsetPx As Single, _
                                   LightSide As LightSideType) As Single

        Dim cita As Single, H As Single, d As Single
       Dim OriginPx As Single
       
        cita = CamParam.VisibleAngleHorizontal
        H = CamParam.StandardLength
        d = CamParam.CamToLight

        Select Case LightSide '�������������߻����ұ�

                Case 0 'left
                        OriginPx = 0.5 * PictureWidth * (1 - d / (H * Tan(0.5 * cita))) '��
                        GetDepthFromOffset = (2 * (H ^ 2) * CSng(Tan(cita * 0.5)) * (OriginPx - OffsetPx)) / (PictureWidth * d + 2 * H * CSng(Tan(cita * 0.5)) * (OriginPx - OffsetPx))

                Case 1 'right
                        OriginPx = 0.5 * PictureWidth * (1 + d / (H * Tan(0.5 * cita))) '��
                        GetDepthFromOffset = (2 * (H ^ 2) * CSng(Tan(cita * 0.5)) * (OffsetPx - OriginPx)) / (PictureWidth * d + 2 * H * CSng(Tan(cita * 0.5)) * (OffsetPx - OriginPx))
        End Select

End Function

