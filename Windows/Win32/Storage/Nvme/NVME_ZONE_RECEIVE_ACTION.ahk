#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ZONE_RECEIVE_ACTION extends Win32Enum {

    /**
     * Native name: NVME_ZONE_RECEIVE_REPORT_ZONES
     * @type {Integer (Int32)}
     */
    static REPORT_ZONES => 0

    /**
     * Native name: NVME_ZONE_RECEIVE_EXTENDED_REPORT_ZONES
     * @type {Integer (Int32)}
     */
    static EXTENDED_REPORT_ZONES => 1
}
