#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE extends Win32Enum {

    /**
     * Native name: IommuDmaLogicalAllocatorNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: IommuDmaLogicalAllocatorBuddy
     * @type {Integer (Int32)}
     */
    static Buddy => 1

    /**
     * Native name: IommuDmaLogicalAllocatorMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
