#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_COMMAND_SET_IDENTIFIERS extends Win32Enum {

    /**
     * Native name: NVME_COMMAND_SET_NVM
     * @type {Integer (Int32)}
     */
    static NVM => 0

    /**
     * Native name: NVME_COMMAND_SET_KEY_VALUE
     * @type {Integer (Int32)}
     */
    static KEY_VALUE => 1

    /**
     * Native name: NVME_COMMAND_SET_ZONED_NAMESPACE
     * @type {Integer (Int32)}
     */
    static ZONED_NAMESPACE => 2
}
