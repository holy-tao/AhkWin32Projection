#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY request to retrieve the trim descriptor data for a device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_trim_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_TRIM_DESCRIPTOR extends Win32Struct
{
    static sizeof => 12

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
     * Specifies whether trim is enabled for the device.
     * @type {BOOLEAN}
     */
    TrimEnabled{
        get {
            if(!this.HasProp("__TrimEnabled"))
                this.__TrimEnabled := BOOLEAN(this.ptr + 8)
            return this.__TrimEnabled
        }
    }
}
