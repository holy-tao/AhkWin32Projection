#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the physical device data of a storage node.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_node_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PHYSICAL_NODE_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The hardware ID of the storage node.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value of 0 or 1 that indicates the adapter count in the storage node.
     * @type {Integer}
     */
    AdapterCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The data length of the storage adapter in the storage node,  in units of kilobytes (1024 bytes).
     * @type {Integer}
     */
    AdapterDataLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The data offset from the beginning of the data structure. The buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_adapter_data">STORAGE_PHYSICAL_ADAPTER_DATA</a>.
     * @type {Integer}
     */
    AdapterDataOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A value less than or equal to 1.
     * @type {Integer}
     */
    DeviceCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The data length of the storage device in the storage node,  in units of kilobytes (1024 bytes).
     * @type {Integer}
     */
    DeviceDataLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The data offset from the beginning of the data structure. The buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_device_data">STORAGE_PHYSICAL_DEVICE_DATA</a>.
     * @type {Integer}
     */
    DeviceDataOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies if the storage adapter is reserved.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
