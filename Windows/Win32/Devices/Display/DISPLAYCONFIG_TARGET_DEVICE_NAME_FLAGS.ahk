#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS structure contains information about a target device.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_device_name_flags
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
