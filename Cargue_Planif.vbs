If Not IsObject(application) Then
   Set SapGuiAuto  = GetObject("SAPGUI")
   Set application = SapGuiAuto.GetScriptingEngine
End If
If Not IsObject(connection) Then
   Set connection = application.Children(0)
End If
If Not IsObject(session) Then
   Set session    = connection.Children(0)
End If
If IsObject(WScript) Then
   WScript.ConnectObject session,     "on"
   WScript.ConnectObject application, "on"
End If

'VB conexion con Excel
Dim objEcxcel
Dim objSheet, intRow
Dim i
Dim x
Set objExcel = GetObject(,"Excel.Application")
Set objSheet = objExcel.ActiveWorkbook.ActiveSheet

'Entrar a la TX
session.findById("wnd[0]/tbar[0]/okcd").text = "/nZPP042"
session.findById("wnd[0]").sendVKey 0

For i = 2 to objSheet.UsedRange.Rows.Count
   
   estado = Trim(CStr(objSheet.Cells(i,10).Value))

   If estado = "Pendiente" Then
      
      'cargar datos cabecera
      material = Trim(CStr(objSheet.Cells(i,1).Value))
      centro = Trim(CStr(objSheet.Cells(i,2).Value))
      areaPlanif = Trim(CStr(objSheet.Cells(i,3).Value))

      session.findById("wnd[0]/usr/ctxtSO_MATNR-LOW").text = material
      session.findById("wnd[0]/usr/ctxtSO_WERKS-LOW").text = centro
      session.findById("wnd[0]/usr/tabsTABSTRIP_TABSTR/tabpUCOMM4").select
      session.findById("wnd[0]/usr/tabsTABSTRIP_TABSTR/tabpUCOMM4/ssub%_SUBSCREEN_TABSTR:RMMDDIBE:0130/ctxtSO_BERID-LOW").text = areaPlanif
      session.findById("wnd[0]/usr/tabsTABSTRIP_TABSTR/tabpUCOMM4/ssub%_SUBSCREEN_TABSTR:RMMDDIBE:0130/btnPTXT1").press

      'seleccionar vistas

      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XDISGR").selected = true
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XDISMM").selected = true
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XMINBE").selected = false
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XDISPO").selected = true
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XDISLS").selected = true
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XRDPRF").selected = false
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XSOBSL").selected = true
      session.findById("wnd[1]/usr/chkSDIBE_MASSFIELDS-XLGPRO").selected = true

      grpoPlanif = Trim(CStr(objSheet.Cells(i,4).Value))
      caractPlanif = Trim(CStr(objSheet.Cells(i,5).Value))
      planifNeces = Trim(CStr(objSheet.Cells(i,6).Value))
      tamLote = Trim(CStr(objSheet.Cells(i,7).Value))
      aprovEsp = Trim(CStr(objSheet.Cells(i,8).Value))
      almacen = Trim(CStr(objSheet.Cells(i,9).Value))


      session.findById("wnd[1]/usr/ctxtMDMA-DISGR").text = grpoPlanif
      session.findById("wnd[1]/usr/ctxtMDMA-DISMM").text = caractPlanif
      session.findById("wnd[1]/usr/ctxtMDMA-DISPO").text = planifNeces
      session.findById("wnd[1]/usr/ctxtMDMA-DISLS").text = tamLote
      session.findById("wnd[1]/usr/ctxtMDMA-SOBSL").text = aprovEsp
      session.findById("wnd[1]/usr/ctxtMDMA-LGPRO").text = almacen
      session.findById("wnd[1]/tbar[0]/btn[0]").press

      session.findById("wnd[0]/tbar[1]/btn[8]").press

      mensaje = session.findById("wnd[0]/usr/subSUBSCREEN:SAPLSBAL_DISPLAY:0101/cntlSAPLSBAL_DISPLAY_CONTAINER/shellcont/shell/shellcont[1]/shell").GetCellValue(0, "T_MSG")
      objExcel.Cells(i,10).Value = mensaje

      session.findById("wnd[0]/tbar[0]/btn[12]").press
      session.findById("wnd[0]/tbar[0]/okcd").text = "/nZPP042"
   End If

Next 'i


MsgBox("Proceso Terminado")