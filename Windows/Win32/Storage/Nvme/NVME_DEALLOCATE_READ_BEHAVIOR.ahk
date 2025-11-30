#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DEALLOCATE_READ_BEHAVIOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_READ_BEHAVIOR_NOT_REPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_READ_BEHAVIOR_RETURN_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_READ_BEHAVIOR_RETURN_ONES => 2
}
