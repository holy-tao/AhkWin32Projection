#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.ahk" { IOMMU_DMA_LOGICAL_ADDRESS_TOKEN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT {
    #StructPack 8

    OwningToken : IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.Ptr

    Offset : IntPtr

    Size : IntPtr

}
