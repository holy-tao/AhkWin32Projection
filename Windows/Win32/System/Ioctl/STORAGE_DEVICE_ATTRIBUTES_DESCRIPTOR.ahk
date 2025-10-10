#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reserved for future use.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_device_attributes_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the version of the data reported.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the quantity of data reported, in bytes. This is the <c>sizeof(STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
