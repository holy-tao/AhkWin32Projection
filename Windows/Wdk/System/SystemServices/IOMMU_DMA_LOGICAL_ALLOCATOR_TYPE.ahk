#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static IommuDmaLogicalAllocatorNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static IommuDmaLogicalAllocatorBuddy => 1

    /**
     * @type {Integer (Int32)}
     */
    static IommuDmaLogicalAllocatorMax => 2
}
