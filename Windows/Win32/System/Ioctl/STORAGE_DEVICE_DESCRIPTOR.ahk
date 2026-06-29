#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\FileSystem\STORAGE_BUS_TYPE.ahk" { STORAGE_BUS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage device descriptor data for a device.
 * @remarks
 * An application can determine the required buffer size by issuing a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> control code 
 *     passing a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_descriptor_header">STORAGE_DESCRIPTOR_HEADER</a> structure 
 *     for the output buffer, and then using the returned <b>Size</b> member of the 
 *     <b>STORAGE_DESCRIPTOR_HEADER</b> structure to allocate 
 *     a buffer of the proper size.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the descriptor, in bytes, which may include vendor ID, product ID, product 
     *       revision, device serial number strings and bus-specific data which are appended to the structure.
     */
    Size : UInt32

    /**
     * Specifies the device type as defined by the Small Computer Systems Interface (SCSI) specification.
     */
    DeviceType : Int8

    /**
     * Specifies the device type modifier, if any, as defined by the SCSI specification. If no device type 
     *       modifier exists, this member is zero.
     */
    DeviceTypeModifier : Int8

    /**
     * Indicates when <b>TRUE</b> that the device's media (if any) is removable. If the device 
     *       has no media, this member should be ignored. When <b>FALSE</b> the device's media is not 
     *       removable.
     */
    RemovableMedia : BOOLEAN

    /**
     * Indicates when <b>TRUE</b> that the device supports multiple outstanding commands (SCSI 
     *       tagged queuing or equivalent). When <b>FALSE</b>, the device does not support SCSI-tagged 
     *       queuing or the equivalent.
     */
    CommandQueueing : BOOLEAN

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's vendor ID. If the device has no vendor ID, this member is zero.
     */
    VendorIdOffset : UInt32

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's product ID. If the device has no product ID, this member is zero.
     */
    ProductIdOffset : UInt32

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's product revision string. If the device has no product revision string, this member is 
     *       zero.
     */
    ProductRevisionOffset : UInt32

    /**
     * Specifies the byte offset from the beginning of the structure to a null-terminated ASCII string that 
     *       contains the device's serial number. If the device has no serial number, this member is zero.
     */
    SerialNumberOffset : UInt32

    /**
     * Specifies an enumerator value of type 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_bus_type">STORAGE_BUS_TYPE</a> that indicates the type of bus to 
     *       which the device is connected. This should be used to interpret the raw device properties at the end of this 
     *       structure (if any).
     */
    BusType : STORAGE_BUS_TYPE

    /**
     * Indicates the number of bytes of bus-specific data that have been appended to this descriptor.
     */
    RawPropertiesLength : UInt32

    /**
     * Contains an array of length one that serves as a place holder for the first byte of the bus specific 
     *       property data.
     */
    RawDeviceProperties : Int8[1]

}
