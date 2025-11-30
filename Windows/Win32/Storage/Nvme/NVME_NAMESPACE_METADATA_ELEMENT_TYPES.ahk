#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NAMESPACE_METADATA_ELEMENT_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_PREBOOT_NAMESPACE_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_2 => 4
}
