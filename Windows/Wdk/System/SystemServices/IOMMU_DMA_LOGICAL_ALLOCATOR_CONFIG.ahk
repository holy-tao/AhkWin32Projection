#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE.ahk" { IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG {
    #StructPack 4


    struct _BuddyAllocatorConfig {
        AddressWidth : UInt32

    }

    LogicalAllocatorType : IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE

    BuddyAllocatorConfig : IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG._BuddyAllocatorConfig

}
