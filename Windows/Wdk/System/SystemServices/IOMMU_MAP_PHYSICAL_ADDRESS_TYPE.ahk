#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_MAP_PHYSICAL_ADDRESS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MapPhysicalAddressTypeMdl => 0

    /**
     * @type {Integer (Int32)}
     */
    static MapPhysicalAddressTypeContiguousRange => 1

    /**
     * @type {Integer (Int32)}
     */
    static MapPhysicalAddressTypePfn => 2

    /**
     * @type {Integer (Int32)}
     */
    static MapPhysicalAddressTypeMax => 3
}
