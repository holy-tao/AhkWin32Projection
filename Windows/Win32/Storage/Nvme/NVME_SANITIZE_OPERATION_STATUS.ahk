#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SANITIZE_OPERATION_STATUS extends Win32Enum {

    /**
     * Native name: NVME_SANITIZE_OPERATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: NVME_SANITIZE_OPERATION_SUCCEEDED
     * @type {Integer (Int32)}
     */
    static SUCCEEDED => 1

    /**
     * Native name: NVME_SANITIZE_OPERATION_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 2

    /**
     * Native name: NVME_SANITIZE_OPERATION_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 3

    /**
     * Native name: NVME_SANITIZE_OPERATION_SUCCEEDED_WITH_FORCED_DEALLOCATION
     * @type {Integer (Int32)}
     */
    static SUCCEEDED_WITH_FORCED_DEALLOCATION => 4
}
