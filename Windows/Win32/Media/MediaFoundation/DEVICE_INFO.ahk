#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a media sharing device.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ns-mfsharingengine-device_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DEVICE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The friendly name of the device.
     * @type {Pointer<Char>}
     */
    pFriendlyDeviceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string that uniquely identifies the device.
     * @type {Pointer<Char>}
     */
    pUniqueDeviceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The manufacturer name.
     * @type {Pointer<Char>}
     */
    pManufacturerName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The model name.
     * @type {Pointer<Char>}
     */
    pModelName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The URL of an icon for the device.
     * @type {Pointer<Char>}
     */
    pIconURL {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
