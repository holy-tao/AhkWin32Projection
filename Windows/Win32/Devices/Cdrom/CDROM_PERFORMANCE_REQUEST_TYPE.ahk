#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_PERFORMANCE_REQUEST_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CdromPerformanceRequest => 1

    /**
     * Native name: CdromWriteSpeedRequest
     * @type {Integer (Int32)}
     */
    static WriteSpeedRequest => 2
}
