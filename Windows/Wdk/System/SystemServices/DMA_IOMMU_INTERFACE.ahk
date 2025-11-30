#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_IOMMU_INTERFACE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_CREATE>}
     */
    CreateDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_DELETE>}
     */
    DeleteDomain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_ATTACH_DEVICE>}
     */
    AttachDevice {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_DETACH_DEVICE>}
     */
    DetachDevice {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PIOMMU_FLUSH_DOMAIN>}
     */
    FlushDomain {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PIOMMU_FLUSH_DOMAIN_VA_LIST>}
     */
    FlushDomainByVaList {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PIOMMU_QUERY_INPUT_MAPPINGS>}
     */
    QueryInputMappings {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PIOMMU_MAP_LOGICAL_RANGE>}
     */
    MapLogicalRange {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PIOMMU_UNMAP_LOGICAL_RANGE>}
     */
    UnmapLogicalRange {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PIOMMU_MAP_IDENTITY_RANGE>}
     */
    MapIdentityRange {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PIOMMU_UNMAP_IDENTITY_RANGE>}
     */
    UnmapIdentityRange {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PIOMMU_SET_DEVICE_FAULT_REPORTING>}
     */
    SetDeviceFaultReporting {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PIOMMU_DOMAIN_CONFIGURE>}
     */
    ConfigureDomain {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
