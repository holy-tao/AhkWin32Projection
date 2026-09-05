#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RESERVATION_REGISTER_PTPL_STATE_CHANGES extends Win32Enum {

    /**
     * Native name: NVME_RESERVATION_REGISTER_PTPL_STATE_NO_CHANGE
     * @type {Integer (Int32)}
     */
    static NO_CHANGE => 0

    /**
     * Native name: NVME_RESERVATION_REGISTER_PTPL_STATE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 1

    /**
     * Native name: NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_0
     * @type {Integer (Int32)}
     */
    static SET_TO_0 => 2

    /**
     * Native name: NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_1
     * @type {Integer (Int32)}
     */
    static SET_TO_1 => 3
}
