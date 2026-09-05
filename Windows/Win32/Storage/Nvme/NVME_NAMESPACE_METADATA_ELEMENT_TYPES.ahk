#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_NAMESPACE_METADATA_ELEMENT_TYPES extends Win32Enum {

    /**
     * Native name: NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_NAMESPACE_NAME => 1

    /**
     * Native name: NVME_NAMESPACE_METADATA_PREBOOT_NAMESPACE_NAME
     * @type {Integer (Int32)}
     */
    static PREBOOT_NAMESPACE_NAME => 2

    /**
     * Native name: NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_1
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_1 => 3

    /**
     * Native name: NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_2
     * @type {Integer (Int32)}
     */
    static OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_2 => 4
}
