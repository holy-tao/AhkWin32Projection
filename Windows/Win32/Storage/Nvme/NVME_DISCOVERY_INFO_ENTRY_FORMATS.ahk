#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DISCOVERY_INFO_ENTRY_FORMATS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_BASIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTRY_FORMAT_EXTENDED => 2
}
