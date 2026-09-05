#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ASYNC_EVENT_IMMEDIATE_STATUS_CODES extends Win32Enum {

    /**
     * Native name: NVME_ASYNC_IMMEDIATE_NVM_SUBSYSTEM_NORMAL_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static NVM_SUBSYSTEM_NORMAL_SHUTDOWN => 0
}
