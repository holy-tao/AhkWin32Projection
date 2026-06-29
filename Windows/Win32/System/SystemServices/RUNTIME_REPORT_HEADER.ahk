#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RUNTIME_REPORT_HEADER {
    #StructPack 4

    ReportType : UInt16

    Reserved : UInt16

    ReportSize : UInt32

}
