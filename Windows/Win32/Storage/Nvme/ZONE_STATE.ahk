#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class ZONE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSEO => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSC => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSRO => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSF => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSO => 15
}
