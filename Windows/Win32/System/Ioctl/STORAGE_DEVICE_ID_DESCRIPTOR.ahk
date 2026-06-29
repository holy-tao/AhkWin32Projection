#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the IOCTL_STORAGE_QUERY_PROPERTY control code request to retrieve the device ID descriptor data for a device.
 * @remarks
 * The device ID descriptor consists of an array of device IDs taken from the SCSI-3 vital product data (VPD) 
 *     page 0x83 that was retrieved during discovery.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_id_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_ID_DESCRIPTOR {
    #StructPack 4

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
     * Contains the number of identifiers reported by the device in the <b>Identifiers</b> array.
     */
    NumberOfIdentifiers : UInt32

    /**
     * Contains a variable-length array of identification descriptors.
     */
    Identifiers : Int8[1]

}
