#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTPROVIDOR extends Win32Struct
{
    static sizeof => 864

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    fpOpenPrinter {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    fpSetJob {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    fpGetJob {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    fpEnumJobs {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinter {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinter {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    fpSetPrinter {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinter {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrinters {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinterDriver {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrinterDrivers {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinterDriver {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinterDriverDirectory {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterDriver {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrintProcessor {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrintProcessors {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrintProcessorDirectory {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrintProcessor {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrintProcessorDatatypes {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer}
     */
    fpStartDocPrinter {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer}
     */
    fpStartPagePrinter {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer}
     */
    fpWritePrinter {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer}
     */
    fpEndPagePrinter {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer}
     */
    fpAbortPrinter {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer}
     */
    fpReadPrinter {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer}
     */
    fpEndDocPrinter {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer}
     */
    fpAddJob {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer}
     */
    fpScheduleJob {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinterData {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer}
     */
    fpSetPrinterData {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer}
     */
    fpWaitForPrinterChange {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer}
     */
    fpClosePrinter {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer}
     */
    fpAddForm {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer}
     */
    fpDeleteForm {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer}
     */
    fpGetForm {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer}
     */
    fpSetForm {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer}
     */
    fpEnumForms {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer}
     */
    fpEnumMonitors {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPorts {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer}
     */
    fpAddPort {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer}
     */
    fpConfigurePort {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePort {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * @type {Pointer}
     */
    fpCreatePrinterIC {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * @type {Pointer}
     */
    fpPlayGdiScriptOnPrinterIC {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterIC {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinterConnection {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterConnection {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Pointer}
     */
    fpPrinterMessageBox {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Pointer}
     */
    fpAddMonitor {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {Pointer}
     */
    fpDeleteMonitor {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Pointer}
     */
    fpResetPrinter {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinterDriverEx {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer}
     */
    fpFindFirstPrinterChangeNotification {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer}
     */
    fpFindClosePrinterChangeNotification {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * @type {Pointer}
     */
    fpAddPortEx {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * @type {Pointer}
     */
    fpShutDown {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * @type {Pointer}
     */
    fpRefreshPrinterChangeNotification {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }

    /**
     * @type {Pointer}
     */
    fpOpenPrinterEx {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinterEx {
        get => NumGet(this, 464, "ptr")
        set => NumPut("ptr", value, this, 464)
    }

    /**
     * @type {Pointer}
     */
    fpSetPort {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrinterData {
        get => NumGet(this, 480, "ptr")
        set => NumPut("ptr", value, this, 480)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterData {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * @type {Pointer}
     */
    fpClusterSplOpen {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }

    /**
     * @type {Pointer}
     */
    fpClusterSplClose {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }

    /**
     * @type {Pointer}
     */
    fpClusterSplIsAlive {
        get => NumGet(this, 512, "ptr")
        set => NumPut("ptr", value, this, 512)
    }

    /**
     * @type {Pointer}
     */
    fpSetPrinterDataEx {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrinterDataEx {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrinterDataEx {
        get => NumGet(this, 536, "ptr")
        set => NumPut("ptr", value, this, 536)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPrinterKey {
        get => NumGet(this, 544, "ptr")
        set => NumPut("ptr", value, this, 544)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterDataEx {
        get => NumGet(this, 552, "ptr")
        set => NumPut("ptr", value, this, 552)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterKey {
        get => NumGet(this, 560, "ptr")
        set => NumPut("ptr", value, this, 560)
    }

    /**
     * @type {Pointer}
     */
    fpSeekPrinter {
        get => NumGet(this, 568, "ptr")
        set => NumPut("ptr", value, this, 568)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePrinterDriverEx {
        get => NumGet(this, 576, "ptr")
        set => NumPut("ptr", value, this, 576)
    }

    /**
     * @type {Pointer}
     */
    fpAddPerMachineConnection {
        get => NumGet(this, 584, "ptr")
        set => NumPut("ptr", value, this, 584)
    }

    /**
     * @type {Pointer}
     */
    fpDeletePerMachineConnection {
        get => NumGet(this, 592, "ptr")
        set => NumPut("ptr", value, this, 592)
    }

    /**
     * @type {Pointer}
     */
    fpEnumPerMachineConnections {
        get => NumGet(this, 600, "ptr")
        set => NumPut("ptr", value, this, 600)
    }

    /**
     * @type {Pointer}
     */
    fpXcvData {
        get => NumGet(this, 608, "ptr")
        set => NumPut("ptr", value, this, 608)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinterDriverEx {
        get => NumGet(this, 616, "ptr")
        set => NumPut("ptr", value, this, 616)
    }

    /**
     * @type {Pointer}
     */
    fpSplReadPrinter {
        get => NumGet(this, 624, "ptr")
        set => NumPut("ptr", value, this, 624)
    }

    /**
     * @type {Pointer}
     */
    fpDriverUnloadComplete {
        get => NumGet(this, 632, "ptr")
        set => NumPut("ptr", value, this, 632)
    }

    /**
     * @type {Pointer}
     */
    fpGetSpoolFileInfo {
        get => NumGet(this, 640, "ptr")
        set => NumPut("ptr", value, this, 640)
    }

    /**
     * @type {Pointer}
     */
    fpCommitSpoolData {
        get => NumGet(this, 648, "ptr")
        set => NumPut("ptr", value, this, 648)
    }

    /**
     * @type {Pointer}
     */
    fpCloseSpoolFileHandle {
        get => NumGet(this, 656, "ptr")
        set => NumPut("ptr", value, this, 656)
    }

    /**
     * @type {Pointer}
     */
    fpFlushPrinter {
        get => NumGet(this, 664, "ptr")
        set => NumPut("ptr", value, this, 664)
    }

    /**
     * @type {Pointer}
     */
    fpSendRecvBidiData {
        get => NumGet(this, 672, "ptr")
        set => NumPut("ptr", value, this, 672)
    }

    /**
     * @type {Pointer}
     */
    fpAddPrinterConnection2 {
        get => NumGet(this, 680, "ptr")
        set => NumPut("ptr", value, this, 680)
    }

    /**
     * @type {Pointer}
     */
    fpGetPrintClassObject {
        get => NumGet(this, 688, "ptr")
        set => NumPut("ptr", value, this, 688)
    }

    /**
     * @type {Pointer}
     */
    fpReportJobProcessingProgress {
        get => NumGet(this, 696, "ptr")
        set => NumPut("ptr", value, this, 696)
    }

    /**
     * @type {Pointer}
     */
    fpEnumAndLogProvidorObjects {
        get => NumGet(this, 704, "ptr")
        set => NumPut("ptr", value, this, 704)
    }

    /**
     * @type {Pointer}
     */
    fpInternalGetPrinterDriver {
        get => NumGet(this, 712, "ptr")
        set => NumPut("ptr", value, this, 712)
    }

    /**
     * @type {Pointer}
     */
    fpFindCompatibleDriver {
        get => NumGet(this, 720, "ptr")
        set => NumPut("ptr", value, this, 720)
    }

    /**
     * @type {Pointer}
     */
    fpInstallPrinterDriverPackageFromConnection {
        get => NumGet(this, 728, "ptr")
        set => NumPut("ptr", value, this, 728)
    }

    /**
     * @type {Pointer}
     */
    fpGetJobNamedPropertyValue {
        get => NumGet(this, 736, "ptr")
        set => NumPut("ptr", value, this, 736)
    }

    /**
     * @type {Pointer}
     */
    fpSetJobNamedProperty {
        get => NumGet(this, 744, "ptr")
        set => NumPut("ptr", value, this, 744)
    }

    /**
     * @type {Pointer}
     */
    fpDeleteJobNamedProperty {
        get => NumGet(this, 752, "ptr")
        set => NumPut("ptr", value, this, 752)
    }

    /**
     * @type {Pointer}
     */
    fpEnumJobNamedProperties {
        get => NumGet(this, 760, "ptr")
        set => NumPut("ptr", value, this, 760)
    }

    /**
     * @type {Pointer}
     */
    fpPowerEvent {
        get => NumGet(this, 768, "ptr")
        set => NumPut("ptr", value, this, 768)
    }

    /**
     * @type {Pointer}
     */
    fpGetUserPropertyBag {
        get => NumGet(this, 776, "ptr")
        set => NumPut("ptr", value, this, 776)
    }

    /**
     * @type {Pointer}
     */
    fpCanShutdown {
        get => NumGet(this, 784, "ptr")
        set => NumPut("ptr", value, this, 784)
    }

    /**
     * @type {Pointer}
     */
    fpLogJobInfoForBranchOffice {
        get => NumGet(this, 792, "ptr")
        set => NumPut("ptr", value, this, 792)
    }

    /**
     * @type {Pointer}
     */
    fpRegeneratePrintDeviceCapabilities {
        get => NumGet(this, 800, "ptr")
        set => NumPut("ptr", value, this, 800)
    }

    /**
     * @type {Pointer}
     */
    fpPrintSupportOperation {
        get => NumGet(this, 808, "ptr")
        set => NumPut("ptr", value, this, 808)
    }

    /**
     * @type {Pointer}
     */
    fpIppCreateJobOnPrinter {
        get => NumGet(this, 816, "ptr")
        set => NumPut("ptr", value, this, 816)
    }

    /**
     * @type {Pointer}
     */
    fpIppGetJobAttributes {
        get => NumGet(this, 824, "ptr")
        set => NumPut("ptr", value, this, 824)
    }

    /**
     * @type {Pointer}
     */
    fpIppSetJobAttributes {
        get => NumGet(this, 832, "ptr")
        set => NumPut("ptr", value, this, 832)
    }

    /**
     * @type {Pointer}
     */
    fpIppGetPrinterAttributes {
        get => NumGet(this, 840, "ptr")
        set => NumPut("ptr", value, this, 840)
    }

    /**
     * @type {Pointer}
     */
    fpIppSetPrinterAttributes {
        get => NumGet(this, 848, "ptr")
        set => NumPut("ptr", value, this, 848)
    }

    /**
     * @type {Pointer}
     */
    fpIppCreateJobOnPrinterWithAttributes {
        get => NumGet(this, 856, "ptr")
        set => NumPut("ptr", value, this, 856)
    }
}
