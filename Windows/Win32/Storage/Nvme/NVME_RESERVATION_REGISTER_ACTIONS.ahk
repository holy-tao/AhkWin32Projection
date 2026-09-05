#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RESERVATION_REGISTER_ACTIONS extends Win32Enum {

    /**
     * Native name: NVME_RESERVATION_REGISTER_ACTION_REGISTER
     * @type {Integer (Int32)}
     */
    static ACTION_REGISTER => 0

    /**
     * Native name: NVME_RESERVATION_REGISTER_ACTION_UNREGISTER
     * @type {Integer (Int32)}
     */
    static ACTION_UNREGISTER => 1

    /**
     * Native name: NVME_RESERVATION_REGISTER_ACTION_REPLACE
     * @type {Integer (Int32)}
     */
    static ACTION_REPLACE => 2
}
