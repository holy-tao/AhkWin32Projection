#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_LOGICAL_ADDRESS_TOKEN {
    #StructPack 8

    LogicalAddressBase : Int64

    Size : IntPtr

}
