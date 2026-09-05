#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RESERVATION_RELEASE_ACTIONS extends Win32Enum {

    /**
     * Native name: NVME_RESERVATION_RELEASE_ACTION_RELEASE
     * @type {Integer (Int32)}
     */
    static ACTION_RELEASE => 0

    /**
     * Native name: NVME_RESERVATION_RELEASE_ACTION_CLEAR
     * @type {Integer (Int32)}
     */
    static ACTION_CLEAR => 1
}
