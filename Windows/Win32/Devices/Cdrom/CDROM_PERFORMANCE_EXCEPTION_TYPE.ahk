#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_PERFORMANCE_EXCEPTION_TYPE extends Win32Enum {

    /**
     * Native name: CdromNominalPerformance
     * @type {Integer (Int32)}
     */
    static NominalPerformance => 1

    /**
     * Native name: CdromEntirePerformanceList
     * @type {Integer (Int32)}
     */
    static EntirePerformanceList => 2

    /**
     * Native name: CdromPerformanceExceptionsOnly
     * @type {Integer (Int32)}
     */
    static ExceptionsOnly => 3
}
