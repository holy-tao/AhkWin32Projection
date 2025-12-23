#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DISCOVERY_INFO_ENTITY_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTITY_TYPE_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTITY_TYPE_HOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTITY_TYPE_DDC => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DISCOVERY_INFO_ENTITY_TYPE_CDC => 3
}
