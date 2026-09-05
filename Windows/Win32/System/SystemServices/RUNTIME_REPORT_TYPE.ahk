#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class RUNTIME_REPORT_TYPE extends Win32Enum {

    /**
     * Native name: RuntimeReportTypeDriver
     * @type {Integer (Int32)}
     */
    static Driver => 0

    /**
     * Native name: RuntimeReportTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 1
}
