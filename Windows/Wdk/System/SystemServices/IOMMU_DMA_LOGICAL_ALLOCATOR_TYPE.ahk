#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE extends Win32Enum{

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
