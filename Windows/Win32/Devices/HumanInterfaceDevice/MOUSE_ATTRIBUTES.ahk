#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * MOUSE_ATTRIBUTES specifies the attributes of a mouse device.
 * @remarks
 * This structure is used with an <a href="https://docs.microsoft.com/windows/desktop/api/ntddmou/ni-ntddmou-ioctl_mouse_query_attributes">IOCTL_MOUSE_QUERY_ATTRIBUTES</a> request to obtain the attributes of a mouse.
 * @see https://learn.microsoft.com/windows/win32/api/ntddmou/ns-ntddmou-mouse_attributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct MOUSE_ATTRIBUTES {
    #StructPack 4

    /**
     * Specifies one of the following types of mouse devices.
     * 
     * <table>
     * <tr>
     * <th>Mouse type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * BALLPOINT_I8042_HARDWARE
     * 
     * </td>
     * <td>
     * i8042 port ballpoint mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BALLPOINT_SERIAL_HARDWARE
     * 
     * </td>
     * <td>
     * Serial port ballpoint mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_HID_HARDWARE
     * 
     * </td>
     * <td>
     * HIDClass mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_I8042_HARDWARE
     * 
     * </td>
     * <td>
     * i8042 port mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_INPORT_HARDWARE
     * 
     * </td>
     * <td>
     * Inport (bus) mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * MOUSE_SERIAL_HARDWARE
     * 
     * </td>
     * <td>
     * Serial port mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * WHEELMOUSE_HID_HARDWARE
     * 
     * </td>
     * <td>
     * HIDClass wheel mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * WHEELMOUSE_I8042_HARDWARE
     * 
     * </td>
     * <td>
     * i8042 port wheel mouse
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * WHEELMOUSE_SERIAL_HARDWARE
     * 
     * </td>
     * <td>
     * Serial port wheel mouse
     * 
     * </td>
     * </tr>
     * </table>
     */
    MouseIdentifier : UInt16

    /**
     * Specifies the number of buttons supported by a mouse. A mouse can have from two to five buttons. The default value is MOUSE_NUMBER_OF_BUTTONS.
     */
    NumberOfButtons : UInt16

    /**
     * Specifies the rate, in reports per second, at which input from a PS/2 mouse is sampled. The default value is MOUSE_SAMPLE_RATE. This value is not used for USB devices.
     */
    SampleRate : UInt16

    /**
     * Specifies the size, in bytes, of the input data queue used by the port driver for a mouse device.
     */
    InputDataQueueLength : UInt32

}
