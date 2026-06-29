#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * KEYBOARD_INPUT_DATA contains one packet of keyboard input data.
 * @remarks
 * In response to an <a href="https://docs.microsoft.com/previous-versions/ff542213(v=vs.85)">IRP_MJ_READ (Kbdclass)</a> request, Kbdclass transfers zero or more <b>KEYBOARD_INPUT_DATA</b> structures from its internal data queue to the Win32 subsystem buffer.
 * @see https://learn.microsoft.com/windows/win32/api/ntddkbd/ns-ntddkbd-keyboard_input_data
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct KEYBOARD_INPUT_DATA {
    #StructPack 4

    /**
     * Specifies the unit number of a keyboard device. A keyboard device name has the format \Device\KeyboardPort<i>N</i>, where the suffix <i>N </i> is the unit number of the device. For example, a device, whose name is \Device\KeyboardPort0, has a unit number of zero, and a device, whose name is \Device\KeyboardPort1, has a unit number of one.
     */
    UnitId : UInt16

    /**
     * Specifies the scan code associated with a key press.
     */
    MakeCode : UInt16

    /**
     * Specifies a bitwise OR of one or more of the following flags that indicate whether a key was pressed or released, and other miscellaneous information.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * KEY_MAKE
     * 
     * </td>
     * <td>
     * The key was pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEY_BREAK
     * 
     * </td>
     * <td>
     * The key was released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEY_E0
     * 
     * </td>
     * <td>
     * Extended scan code used to indicate special keyboard functions. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * KEY_E1
     * 
     * </td>
     * <td>
     * Extended scan code used to indicate special keyboard functions. 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt16

    /**
     * Reserved for operating system use.
     */
    Reserved : UInt16

    /**
     * Specifies device-specific information associated with a keyboard event.
     */
    ExtraInformation : UInt32

}
