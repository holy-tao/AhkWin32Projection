#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_PERFORMANCE_EXCEPTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CdromNominalPerformance => 1

    /**
     * @type {Integer (Int32)}
     */
    static CdromEntirePerformanceList => 2

    /**
     * @type {Integer (Int32)}
     */
    static CdromPerformanceExceptionsOnly => 3
}
