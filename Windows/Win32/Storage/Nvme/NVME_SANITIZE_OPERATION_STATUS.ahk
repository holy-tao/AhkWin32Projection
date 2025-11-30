#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SANITIZE_OPERATION_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_OPERATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_OPERATION_SUCCEEDED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_OPERATION_IN_PROGRESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_OPERATION_FAILED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_OPERATION_SUCCEEDED_WITH_FORCED_DEALLOCATION => 4
}
