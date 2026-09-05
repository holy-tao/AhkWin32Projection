#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_MAP_PHYSICAL_ADDRESS_TYPE extends Win32Enum {

    /**
     * Native name: MapPhysicalAddressTypeMdl
     * @type {Integer (Int32)}
     */
    static Mdl => 0

    /**
     * Native name: MapPhysicalAddressTypeContiguousRange
     * @type {Integer (Int32)}
     */
    static ContiguousRange => 1

    /**
     * Native name: MapPhysicalAddressTypePfn
     * @type {Integer (Int32)}
     */
    static Pfn => 2

    /**
     * Native name: MapPhysicalAddressTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
