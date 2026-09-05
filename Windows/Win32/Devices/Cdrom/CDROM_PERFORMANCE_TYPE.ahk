#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_PERFORMANCE_TYPE extends Win32Enum {

    /**
     * Native name: CdromReadPerformance
     * @type {Integer (Int32)}
     */
    static ReadPerformance => 1

    /**
     * Native name: CdromWritePerformance
     * @type {Integer (Int32)}
     */
    static WritePerformance => 2
}
