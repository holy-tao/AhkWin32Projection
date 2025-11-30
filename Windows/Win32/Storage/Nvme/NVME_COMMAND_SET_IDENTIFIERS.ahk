#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_SET_IDENTIFIERS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_SET_NVM => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_SET_KEY_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_SET_ZONED_NAMESPACE => 2
}
