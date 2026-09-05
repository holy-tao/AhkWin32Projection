#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_DISCOVERY_INFO_ENTITY_TYPES extends Win32Enum {

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTITY_TYPE_RESERVED
     * @type {Integer (Int32)}
     */
    static TYPE_RESERVED => 0

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTITY_TYPE_HOST
     * @type {Integer (Int32)}
     */
    static TYPE_HOST => 1

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTITY_TYPE_DDC
     * @type {Integer (Int32)}
     */
    static TYPE_DDC => 2

    /**
     * Native name: NVME_DISCOVERY_INFO_ENTITY_TYPE_CDC
     * @type {Integer (Int32)}
     */
    static TYPE_CDC => 3
}
