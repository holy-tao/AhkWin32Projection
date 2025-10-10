#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MOUSE_INPUT_DATA contains one packet of mouse input data.
 * @remarks
 * 
  * In response to <a href="https://docs.microsoft.com/previous-versions/ff542215(v=vs.85)">IRP_MJ_READ (Mouclass)</a> requests, Mouclass transfers zero or more <b>MOUSE_INPUT_DATA</b> structures from its internal data queue to the Microsoft Win32 subsystem buffer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddmou/ns-ntddmou-mouse_input_data
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class MOUSE_INPUT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Specifies the unit number of the mouse device. A mouse <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/nt-device-names">device name</a> has the format \Device\PointerPort<i>N</i>, where the suffix <i>N </i>is the unit number of the device. For example, a device, whose name is \Device\PointerPort0, has a unit number of zero, and a device, whose name is \Device\PointerPort1, has a unit number of one.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies a bitwise OR of one or more of the following mouse indicator flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_MOVE_RELATIVE
     * 
     * </td>
     * <td>
     * The <b>LastX</b> and <b>LastY</b> are set relative to the previous location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_MOVE_ABSOLUTE
     * 
     * </td>
     * <td>
     * The <b>LastX</b> and <b>LastY</b> values are set to absolute values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_VIRTUAL_DESKTOP
     * 
     * </td>
     * <td>
     * The mouse coordinates are mapped to the virtual desktop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_ATTRIBUTES_CHANGED
     * 
     * </td>
     * <td>
     * The mouse attributes have changed. The other data in the structure is not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_MOVE_NOCOALESCE
     * 
     * </td>
     * <td>
     * (Windows Vista and later) WM_MOUSEMOVE notification messages will not be coalesced. By default, these messages are coalesced.
     * 
     * For more information about WM_MOUSEMOVE notification messages, see the Microsoft Software Development Kit (SDK) documentation
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Buttons {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ButtonFlags {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ButtonData {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the raw state of the mouse buttons. The Win32 subsystem does not use this member.
     * @type {Integer}
     */
    RawButtons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the signed relative or absolute motion in the x direction.
     * @type {Integer}
     */
    LastX {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the signed relative or absolute motion in the y direction.
     * @type {Integer}
     */
    LastY {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies device-specific information.
     * @type {Integer}
     */
    ExtraInformation {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
