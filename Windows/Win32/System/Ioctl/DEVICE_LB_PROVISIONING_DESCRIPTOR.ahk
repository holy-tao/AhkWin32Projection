#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the thin provisioning capabilities for a storage device.
 * @remarks
 * This structure is returned from a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> request when the 
 *     <b>PropertyId</b> member of 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> is set to 
 *     <b>StorageDeviceLBProvisioningProperty</b>.
 * 
 * If <b>UnmapGranularityAlignmentValid</b> = 0, then any code using 
 *     <b>UnmapGranularityAlignment</b> should assume it has a value of 0.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_lb_provisioning_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_LB_PROVISIONING_DESCRIPTOR {
    #StructPack 8

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * This bitfield backs the following members:
     * - ThinProvisioningEnabled
     * - ThinProvisioningReadZeros
     * - AnchorSupported
     * - UnmapGranularityAlignmentValid
     * - GetFreeSpaceSupported
     * - MapSupported
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ThinProvisioningEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ThinProvisioningReadZeros {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    AnchorSupported {
        get => (this._bitfield >> 2) & 0x7
        set => this._bitfield := ((value & 0x7) << 2) | (this._bitfield & ~(0x7 << 2))
    }

    /**
     * @type {Integer}
     */
    UnmapGranularityAlignmentValid {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    GetFreeSpaceSupported {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    MapSupported {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    /**
     * Reserved.
     */
    Reserved1 : Int8[7]

    /**
     * The optimal number of logical sectors for unmap granularity for the device.
     */
    OptimalUnmapGranularity : Int64

    /**
     * The current value, in logical sectors, set for unmap granularity alignment on the device.
     */
    UnmapGranularityAlignment : Int64

    /**
     * <b>Starting in Windows 10: </b>The maximum number of LBAs that can be unmapped in a single unmap command, in logical blocks.
     */
    MaxUnmapLbaCount : UInt32

    /**
     * <b>Starting in Windows 10: </b>The maximum number of descriptors allowed in a single unmap command.
     */
    MaxUnmapBlockDescriptorCount : UInt32

}
