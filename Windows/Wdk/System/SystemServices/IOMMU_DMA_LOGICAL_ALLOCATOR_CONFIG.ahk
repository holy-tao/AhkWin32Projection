#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {IOMMU_DMA_LOGICAL_ALLOCATOR_TYPE}
     */
    LogicalAllocatorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _BuddyAllocatorConfig extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        AddressWidth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_BuddyAllocatorConfig}
     */
    BuddyAllocatorConfig {
        get {
            if(!this.HasProp("__BuddyAllocatorConfig"))
                this.__BuddyAllocatorConfig := IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG._BuddyAllocatorConfig(4, this)
            return this.__BuddyAllocatorConfig
        }
    }
}
