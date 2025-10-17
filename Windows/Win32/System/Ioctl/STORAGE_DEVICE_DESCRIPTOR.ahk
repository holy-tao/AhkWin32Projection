#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage device descriptor data for a device.
 * @remarks
 * 
  * An application can determine the required buffer size by issuing a 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> control code 
  *     passing a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_descriptor_header">STORAGE_DESCRIPTOR_HEADER</a> structure 
  *     for the output buffer, and then using the returned <b>Size</b> member of the 
  *     <b>STORAGE_DESCRIPTOR_HEADER</b> structure to allocate 
  *     a buffer of the proper size.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_device_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

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
     * Specifies the total size of the descriptor, in bytes, which may include vendor ID, product ID, product 
     *       revision, device serial number strings and bus-specific data which are appended to the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the device type as defined by the Small Computer Systems Interface (SCSI) specification.
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies the device type modifier, if any, as defined by the SCSI specification. If no device type 
     *       modifier exists, this member is zero.
     * @type {Integer}
     */
    DeviceTypeModifier {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Indicates when <b>TRUE</b> that the device's media (if any) is removable. If the device 
     *       has no media, this member should be ignored. When <b>FALSE</b> the device's media is not 
     *       removable.
     * @type {BOOLEAN}
     */
    RemovableMedia {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Indicates when <b>TRUE</b> that the device supports multiple outstanding commands (SCSI 
     *       tagged queuing or equivalent). When <b>FALSE</b>, the device does not support SCSI-tagged 
     *       queuing or the equivalent.
     * @type {BOOLEAN}
     */
    CommandQueueing {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's vendor ID. If the device has no vendor ID, this member is zero.
     * @type {Integer}
     */
    VendorIdOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's product ID. If the device has no product ID, this member is zero.
     * @type {Integer}
     */
    ProductIdOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's product revision string. If the device has no product revision string, this member is 
     *       zero.
     * @type {Integer}
     */
    ProductRevisionOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's serial number. If the device has no serial number, this member is zero.
     * @type {Integer}
     */
    SerialNumberOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies an enumerator value of type 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_bus_type">STORAGE_BUS_TYPE</a> that indicates the type of bus to 
     *       which the device is connected. This should be used to interpret the raw device properties at the end of this 
     *       structure (if any).
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Indicates the number of bytes of bus-specific data that have been appended to this descriptor.
     * @type {Integer}
     */
    RawPropertiesLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Contains an array of length one that serves as a place holder for the first byte of the bus specific 
     *       property data.
     * @type {Array<Byte>}
     */
    RawDeviceProperties{
        get {
            if(!this.HasProp("__RawDevicePropertiesProxyArray"))
                this.__RawDevicePropertiesProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__RawDevicePropertiesProxyArray
        }
    }
}
