#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIHIDFFINITINFO structure is used by DirectInput to provide information to a HID force-feedback driver about the device it is being asked to control.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-dihidffinitinfo
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIHIDFFINITINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points to a null-terminated Unicode string that identifies the device interface for the device. The driver can pass the device interface to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to obtain access to the device.
     * @type {Pointer<Char>}
     */
    pwszDeviceInterface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a device instance GUID for this device.
     * @type {Pointer<Guid>}
     */
    GuidInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
