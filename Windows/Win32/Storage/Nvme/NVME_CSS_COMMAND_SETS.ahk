#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CSS_COMMAND_SETS extends Win32Enum {

    /**
     * Native name: NVME_CSS_NVM_COMMAND_SET
     * @type {Integer (Int32)}
     */
    static NVM_COMMAND_SET => 0

    /**
     * Native name: NVME_CSS_ALL_SUPPORTED_IO_COMMAND_SET
     * @type {Integer (Int32)}
     */
    static ALL_SUPPORTED_IO_COMMAND_SET => 6

    /**
     * Native name: NVME_CSS_ADMIN_COMMAND_SET_ONLY
     * @type {Integer (Int32)}
     */
    static ADMIN_COMMAND_SET_ONLY => 7
}
