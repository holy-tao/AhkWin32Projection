#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RUNTIME_REPORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RuntimeReportTypeDriver => 0

    /**
     * @type {Integer (Int32)}
     */
    static RuntimeReportTypeMax => 1
}
