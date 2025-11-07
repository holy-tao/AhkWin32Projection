#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * KEYBOARD_UNIT_ID_PARAMETER specifies the unit ID that Kbdclass assigns to a keyboard.
 * @remarks
 * 
 * Although this structure is used with IOCTL_KEYBOARD_QUERY_Xxx requests, Kbdclass does not use the <b>UnitId</b> value.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddkbd/ns-ntddkbd-keyboard_unit_id_parameter
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_UNIT_ID_PARAMETER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * Specifies the unit number of a keyboard device. A keyboard device name has the format \Device\KeyboardPort<i>N</i>, where the suffix <i>N </i>is the unit number of the device. For example, a device, whose name is \Device\KeyboardPort0, has a unit number of zero, and a device, whose name is \Device\KeyboardPort1, has a unit number of one.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
