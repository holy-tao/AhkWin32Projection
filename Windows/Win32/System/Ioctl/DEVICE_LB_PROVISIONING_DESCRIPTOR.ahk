#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the thin provisioning capabilities for a storage device.
 * @remarks
 * 
  * This structure is returned from a 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> request when the 
  *     <b>PropertyId</b> member of 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> is set to 
  *     <b>StorageDeviceLBProvisioningProperty</b>.
  * 
  * If <b>UnmapGranularityAlignmentValid</b> = 0, then any code using 
  *     <b>UnmapGranularityAlignment</b> should assume it has a value of 0.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_lb_provisioning_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_LB_PROVISIONING_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - ThinProvisioningEnabled
     * - ThinProvisioningReadZeros
     * - AnchorSupported
     * - UnmapGranularityAlignmentValid
     * - GetFreeSpaceSupported
     * - MapSupported
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * The thin provisioning–enabled status.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thin provisioning is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thin provisioning is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ThinProvisioningEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Reads to unmapped regions return zeros.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data read from unmapped regions is undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reads return zeros.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ThinProvisioningReadZeros {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Deterministic read after trim support.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deterministic read after trim is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deterministic read after trim is supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AnchorSupported {
        get => (this._bitfield >> 2) & 0x7
        set => this._bitfield := ((value & 0x7) << 2) | (this._bitfield & ~(0x7 << 2))
    }

    /**
     * The validity of unmap granularity alignment for the device.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unmap granularity alignment is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unmap granularity alignment is valid.
     * 
     * </td>
     * </tr>
     * </table>
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
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 9, 7, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * The optimal number of logical sectors for unmap granularity for the device.
     * @type {Integer}
     */
    OptimalUnmapGranularity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The current value, in logical sectors, set for unmap granularity alignment on the device.
     * @type {Integer}
     */
    UnmapGranularityAlignment {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>Starting in Windows 10: </b>The maximum number of LBAs that can be unmapped in a single unmap command, in logical blocks.
     * @type {Integer}
     */
    MaxUnmapLbaCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <b>Starting in Windows 10: </b>The maximum number of descriptors allowed in a single unmap command.
     * @type {Integer}
     */
    MaxUnmapBlockDescriptorCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
