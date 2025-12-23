#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_RELEASE_ACTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_RELEASE_ACTION_RELEASE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_RELEASE_ACTION_CLEAR => 1
}
