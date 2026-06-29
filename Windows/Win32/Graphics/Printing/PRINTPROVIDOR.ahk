#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTPROVIDOR {
    #StructPack 8

    fpOpenPrinter : IntPtr

    fpSetJob : IntPtr

    fpGetJob : IntPtr

    fpEnumJobs : IntPtr

    fpAddPrinter : IntPtr

    fpDeletePrinter : IntPtr

    fpSetPrinter : IntPtr

    fpGetPrinter : IntPtr

    fpEnumPrinters : IntPtr

    fpAddPrinterDriver : IntPtr

    fpEnumPrinterDrivers : IntPtr

    fpGetPrinterDriver : IntPtr

    fpGetPrinterDriverDirectory : IntPtr

    fpDeletePrinterDriver : IntPtr

    fpAddPrintProcessor : IntPtr

    fpEnumPrintProcessors : IntPtr

    fpGetPrintProcessorDirectory : IntPtr

    fpDeletePrintProcessor : IntPtr

    fpEnumPrintProcessorDatatypes : IntPtr

    fpStartDocPrinter : IntPtr

    fpStartPagePrinter : IntPtr

    fpWritePrinter : IntPtr

    fpEndPagePrinter : IntPtr

    fpAbortPrinter : IntPtr

    fpReadPrinter : IntPtr

    fpEndDocPrinter : IntPtr

    fpAddJob : IntPtr

    fpScheduleJob : IntPtr

    fpGetPrinterData : IntPtr

    fpSetPrinterData : IntPtr

    fpWaitForPrinterChange : IntPtr

    fpClosePrinter : IntPtr

    fpAddForm : IntPtr

    fpDeleteForm : IntPtr

    fpGetForm : IntPtr

    fpSetForm : IntPtr

    fpEnumForms : IntPtr

    fpEnumMonitors : IntPtr

    fpEnumPorts : IntPtr

    fpAddPort : IntPtr

    fpConfigurePort : IntPtr

    fpDeletePort : IntPtr

    fpCreatePrinterIC : IntPtr

    fpPlayGdiScriptOnPrinterIC : IntPtr

    fpDeletePrinterIC : IntPtr

    fpAddPrinterConnection : IntPtr

    fpDeletePrinterConnection : IntPtr

    fpPrinterMessageBox : IntPtr

    fpAddMonitor : IntPtr

    fpDeleteMonitor : IntPtr

    fpResetPrinter : IntPtr

    fpGetPrinterDriverEx : IntPtr

    fpFindFirstPrinterChangeNotification : IntPtr

    fpFindClosePrinterChangeNotification : IntPtr

    fpAddPortEx : IntPtr

    fpShutDown : IntPtr

    fpRefreshPrinterChangeNotification : IntPtr

    fpOpenPrinterEx : IntPtr

    fpAddPrinterEx : IntPtr

    fpSetPort : IntPtr

    fpEnumPrinterData : IntPtr

    fpDeletePrinterData : IntPtr

    fpClusterSplOpen : IntPtr

    fpClusterSplClose : IntPtr

    fpClusterSplIsAlive : IntPtr

    fpSetPrinterDataEx : IntPtr

    fpGetPrinterDataEx : IntPtr

    fpEnumPrinterDataEx : IntPtr

    fpEnumPrinterKey : IntPtr

    fpDeletePrinterDataEx : IntPtr

    fpDeletePrinterKey : IntPtr

    fpSeekPrinter : IntPtr

    fpDeletePrinterDriverEx : IntPtr

    fpAddPerMachineConnection : IntPtr

    fpDeletePerMachineConnection : IntPtr

    fpEnumPerMachineConnections : IntPtr

    fpXcvData : IntPtr

    fpAddPrinterDriverEx : IntPtr

    fpSplReadPrinter : IntPtr

    fpDriverUnloadComplete : IntPtr

    fpGetSpoolFileInfo : IntPtr

    fpCommitSpoolData : IntPtr

    fpCloseSpoolFileHandle : IntPtr

    fpFlushPrinter : IntPtr

    fpSendRecvBidiData : IntPtr

    fpAddPrinterConnection2 : IntPtr

    fpGetPrintClassObject : IntPtr

    fpReportJobProcessingProgress : IntPtr

    fpEnumAndLogProvidorObjects : IntPtr

    fpInternalGetPrinterDriver : IntPtr

    fpFindCompatibleDriver : IntPtr

    fpInstallPrinterDriverPackageFromConnection : IntPtr

    fpGetJobNamedPropertyValue : IntPtr

    fpSetJobNamedProperty : IntPtr

    fpDeleteJobNamedProperty : IntPtr

    fpEnumJobNamedProperties : IntPtr

    fpPowerEvent : IntPtr

    fpGetUserPropertyBag : IntPtr

    fpCanShutdown : IntPtr

    fpLogJobInfoForBranchOffice : IntPtr

    fpRegeneratePrintDeviceCapabilities : IntPtr

    fpPrintSupportOperation : IntPtr

    fpIppCreateJobOnPrinter : IntPtr

    fpIppGetJobAttributes : IntPtr

    fpIppSetJobAttributes : IntPtr

    fpIppGetPrinterAttributes : IntPtr

    fpIppSetPrinterAttributes : IntPtr

    fpIppCreateJobOnPrinterWithAttributes : IntPtr

}
