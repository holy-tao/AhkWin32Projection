#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * KEYBOARD_INDICATOR_PARAMETERS specifies the state of a keyboard's indicator LEDs.
 * @remarks
 * 
 * This structure is used with <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_query_indicators">IOCTL_KEYBOARD_QUERY_INDICATORS</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_set_indicators">IOCTL_KEYBOARD_SET_INDICATORS</a> requests to query and set keyboard indicator LEDs.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddkbd/ns-ntddkbd-keyboard_indicator_parameters
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_INDICATOR_PARAMETERS extends Win32Struct
{
    static sizeof => 4

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
     * Specifies a bitwise OR of zero or more of the following LED flags: 
     * 
     * <table>
     * <tr>
     * <th>LED Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * KEYBOARD_CAPS_LOCK_ON
     * 
     * </td>
     * <td>
     * CAPS LOCK LED is on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEYBOARD_LED_INJECTED
     * 
     * </td>
     * <td>
     * Used by a Terminal Server. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEYBOARD_NUM_LOCK_ON
     * 
     * </td>
     * <td>
     * NUM LOCK LED is on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEYBOARD_SCROLL_LOCK_ON
     * 
     * </td>
     * <td>
     * SCROLL LOCK LED is on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEYBOARD_SHADOW
     * 
     * </td>
     * <td>
     * Used by a Terminal Server. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    LedFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
