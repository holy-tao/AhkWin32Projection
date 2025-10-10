#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * KEYBOARD_TYPEMATIC_PARAMETERS specifies a keyboard's typematic settings.
 * @remarks
 * 
  * This structure is used with <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_query_typematic">IOCTL_KEYBOARD_QUERY_TYPEMATIC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_set_typematic">IOCTL_KEYBOARD_SET_TYPEMATIC</a> requests to query and set a keyboard's typematic settings.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddkbd/ns-ntddkbd-keyboard_typematic_parameters
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_TYPEMATIC_PARAMETERS extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Specifies the unit number of a keyboard device. A keyboard device name has the format \Device\KeyboardPort<i>N</i>, where the suffix <i>N </i>is the unit number of the device. For example, a device, whose name is \Device\KeyboardPort0, has a unit number of zero, and a device, whose name is \Device\KeyboardPort1, has a unit number of one.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the rate at which character output from a keyboard repeats, in characters per second, after a key is pressed and continuously held down. The minimum possible value is KEYBOARD_TYPEMATIC_RATE_MINIMUM and the maximum possible value is KEYBOARD_TYPEMATIC_RATE_MAXIMUM. The default value is KEYBOARD_TYPEMATIC_RATE_DEFAULT.
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the amount of time that must elapse, in milliseconds, after a key is pressed and continuously held down, before the character output from a keyboard begins to repeat. The minimum possible delay is KEYBOARD_TYPEMATIC_DELAY_MINIMUM and the maximum possible delay is KEYBOARD_TYPEMATIC_DELAY_MAXIMUM. The default value is KEYBOARD_TYPEMATIC_DELAY_DEFAULT.
     * @type {Integer}
     */
    Delay {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
