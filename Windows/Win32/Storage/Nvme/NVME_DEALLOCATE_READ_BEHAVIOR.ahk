#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DEALLOCATE_READ_BEHAVIOR extends Win32Enum {

    /**
     * Native name: NVME_READ_BEHAVIOR_NOT_REPORTED
     * @type {Integer (Int32)}
     */
    static NOT_REPORTED => 0

    /**
     * Native name: NVME_READ_BEHAVIOR_RETURN_ZERO
     * @type {Integer (Int32)}
     */
    static RETURN_ZERO => 1

    /**
     * Native name: NVME_READ_BEHAVIOR_RETURN_ONES
     * @type {Integer (Int32)}
     */
    static RETURN_ONES => 2
}
