#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DISCOVERY_INFO_MGMT_TASK extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_MGMT_TASK_REGISTER => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_MGMT_TASK_DEREGISTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_MGMT_TASK_UPDATE => 2
}
