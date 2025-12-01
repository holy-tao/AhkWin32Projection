#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the IOCTL_STORAGE_QUERY_PROPERTY control code request to retrieve the device ID descriptor data for a device.
 * @remarks
 * The device ID descriptor consists of an array of device IDs taken from the SCSI-3 vital product data (VPD) 
 *     page 0x83 that was retrieved during discovery.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_id_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_ID_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

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
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the number of identifiers reported by the device in the <b>Identifiers</b> array.
     * @type {Integer}
     */
    NumberOfIdentifiers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains a variable-length array of identification descriptors.
     * @type {Array<Byte>}
     */
    Identifiers{
        get {
            if(!this.HasProp("__IdentifiersProxyArray"))
                this.__IdentifiersProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__IdentifiersProxyArray
        }
    }
}
