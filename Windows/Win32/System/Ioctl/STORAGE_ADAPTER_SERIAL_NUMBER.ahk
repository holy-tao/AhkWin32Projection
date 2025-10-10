#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NULL-terminated Unicode string of the adapter serial number for the StorageAdapterSerialNumberProperty as defined in STORAGE_PROPERTY_ID.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_adapter_serial_number
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ADAPTER_SERIAL_NUMBER extends Win32Struct
{
    static sizeof => 264

    static packingSize => 4

    /**
     * The version of this structure. The Size serves as the version.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The serial number.
     * @type {String}
     */
    SerialNumber {
        get => StrGet(this.ptr + 8, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8, 127, "UTF-16")
    }
}
