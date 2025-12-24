#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_IOMMU_INTERFACE_V2 extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Pointer<PIOMMU_DOMAIN_CREATE_EX>}
     */
    CreateDomainEx {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_DELETE>}
     */
    DeleteDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_ATTACH_DEVICE_EX>}
     */
    AttachDeviceEx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_DETACH_DEVICE_EX>}
     */
    DetachDeviceEx {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PIOMMU_FLUSH_DOMAIN>}
     */
    FlushDomain {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PIOMMU_FLUSH_DOMAIN_VA_LIST>}
     */
    FlushDomainByVaList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PIOMMU_QUERY_INPUT_MAPPINGS>}
     */
    QueryInputMappings {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PIOMMU_MAP_LOGICAL_RANGE_EX>}
     */
    MapLogicalRangeEx {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PIOMMU_UNMAP_LOGICAL_RANGE>}
     */
    UnmapLogicalRange {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PIOMMU_MAP_IDENTITY_RANGE_EX>}
     */
    MapIdentityRangeEx {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PIOMMU_UNMAP_IDENTITY_RANGE_EX>}
     */
    UnmapIdentityRangeEx {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PIOMMU_SET_DEVICE_FAULT_REPORTING_EX>}
     */
    SetDeviceFaultReportingEx {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_CONFIGURE>}
     */
    ConfigureDomain {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PIOMMU_DEVICE_QUERY_DOMAIN_TYPES>}
     */
    QueryAvailableDomainTypes {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PIOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK>}
     */
    RegisterInterfaceStateChangeCallback {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PIOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK>}
     */
    UnregisterInterfaceStateChangeCallback {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PIOMMU_RESERVE_LOGICAL_ADDRESS_RANGE>}
     */
    ReserveLogicalAddressRange {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PIOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE>}
     */
    FreeReservedLogicalAddressRange {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PIOMMU_MAP_RESERVED_LOGICAL_RANGE>}
     */
    MapReservedLogicalRange {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PIOMMU_UNMAP_RESERVED_LOGICAL_RANGE>}
     */
    UnmapReservedLogicalRange {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<PIOMMU_DEVICE_CREATE>}
     */
    CreateDevice {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<PIOMMU_DEVICE_DELETE>}
     */
    DeleteDevice {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
