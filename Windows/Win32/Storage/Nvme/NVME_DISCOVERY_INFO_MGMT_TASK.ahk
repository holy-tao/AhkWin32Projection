#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DISCOVERY_INFO_MGMT_TASK extends Win32Enum {

    /**
     * Native name: NVME_DISCOVERY_INFO_MGMT_TASK_REGISTER
     * @type {Integer (Int32)}
     */
    static REGISTER => 0

    /**
     * Native name: NVME_DISCOVERY_INFO_MGMT_TASK_DEREGISTER
     * @type {Integer (Int32)}
     */
    static DEREGISTER => 1

    /**
     * Native name: NVME_DISCOVERY_INFO_MGMT_TASK_UPDATE
     * @type {Integer (Int32)}
     */
    static UPDATE => 2
}
