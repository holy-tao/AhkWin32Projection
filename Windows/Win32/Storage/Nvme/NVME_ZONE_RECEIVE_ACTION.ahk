#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ZONE_RECEIVE_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_RECEIVE_REPORT_ZONES => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_RECEIVE_EXTENDED_REPORT_ZONES => 1
}
