#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the copy offload capabilities for a storage device.
 * @remarks
 * 
 * This structure is returned from a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> request when the 
 *     <b>PropertyId</b> member of 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> is set to 
 *     <b>StorageDeviceCopyOffloadProperty</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_copy_offload_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_COPY_OFFLOAD_DESCRIPTOR extends Win32Struct
{
    static sizeof => 48

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
     * The maximum lifetime of the token, in seconds.
     * @type {Integer}
     */
    MaximumTokenLifetime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The default lifetime of the token, in seconds.
     * @type {Integer}
     */
    DefaultTokenLifetime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum transfer size, in bytes.
     * @type {Integer}
     */
    MaximumTransferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The optimal transfer size, in bytes.
     * @type {Integer}
     */
    OptimalTransferCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The maximum number of data descriptors.
     * @type {Integer}
     */
    MaximumDataDescriptors {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum transfer length, in blocks, per descriptor.
     * @type {Integer}
     */
    MaximumTransferLengthPerDescriptor {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The optimal transfer length per descriptor.
     * @type {Integer}
     */
    OptimalTransferLengthPerDescriptor {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The granularity of the optimal transfer length, in blocks. Transfer lengths that are not an even multiple 
     *       of this length may be delayed.
     * @type {Integer}
     */
    OptimalTransferLengthGranularity {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 46, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
