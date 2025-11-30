#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_REGISTER_PTPL_STATE_CHANGES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_REGISTER_PTPL_STATE_NO_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_REGISTER_PTPL_STATE_RESERVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_0 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_1 => 3
}
