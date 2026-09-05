#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_AMS_OPTION extends Win32Enum {

    /**
     * Native name: NVME_AMS_ROUND_ROBIN
     * @type {Integer (Int32)}
     */
    static ROUND_ROBIN => 0

    /**
     * Native name: NVME_AMS_WEIGHTED_ROUND_ROBIN_URGENT
     * @type {Integer (Int32)}
     */
    static WEIGHTED_ROUND_ROBIN_URGENT => 1
}
