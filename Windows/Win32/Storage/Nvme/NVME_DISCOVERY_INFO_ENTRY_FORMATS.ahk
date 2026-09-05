#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DISCOVERY_INFO_ENTRY_FORMATS extends Win32Enum {

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTRY_FORMAT_RESERVED
     * @type {Integer (Int32)}
     */
    static FORMAT_RESERVED => 0

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTRY_FORMAT_BASIC
     * @type {Integer (Int32)}
     */
    static FORMAT_BASIC => 1

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTRY_FORMAT_EXTENDED
     * @type {Integer (Int32)}
     */
    static FORMAT_EXTENDED => 2
}
