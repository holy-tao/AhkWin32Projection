#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAY_DEVICE_STATE_FLAGS.ahk" { DISPLAY_DEVICE_STATE_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DISPLAY_DEVICE structure receives information about the display device specified by the iDevNum parameter of the EnumDisplayDevices function. (Unicode)
 * @remarks
 * The four string members are set based on the parameters passed to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. If the <i>lpDevice</i> param is <b>NULL</b>, then DISPLAY_DEVICE is filled in with information about the display adapter(s). If it is a valid device name, then it is filled in with information about the monitor(s) for that device.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines DISPLAY_DEVICE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-display_devicew
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct DISPLAY_DEVICEW {
    #StructPack 4

    /**
     * Size, in bytes, of the <b>DISPLAY_DEVICE</b> structure. This must be initialized prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>.
     */
    cb : UInt32

    /**
     * An array of characters identifying the device name. This is either the adapter device or the monitor device.
     */
    DeviceName : WCHAR[32]

    /**
     * An array of characters containing the device context string. This is either a description of the display adapter or of the display monitor.
     */
    DeviceString : WCHAR[128]

    /**
     * Device state flags. It can be any reasonable combination of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_ACTIVE</td>
     * <td>DISPLAY_DEVICE_ACTIVE specifies whether a monitor is  presented as being "on" by the respective GDI view. <b>Windows Vista:</b> EnumDisplayDevices will only enumerate monitors that can be presented as being "on."
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_MIRRORING_DRIVER</td>
     * <td>Represents a pseudo device used to mirror application drawing for remoting or other purposes. An invisible pseudo monitor is associated with this device. For example, NetMeeting uses it. Note that <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> (SM_MONITORS) only accounts for visible display monitors.</td>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_MODESPRUNED</td>
     * <td>The device has more display modes than its output devices support.</td>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_PRIMARY_DEVICE</td>
     * <td>The primary desktop is on the device. For a system with a single display card, this is always set. For a system with multiple display cards, only one device can have this set.</td>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_REMOVABLE</td>
     * <td>The device is removable; it cannot be the primary display.</td>
     * </tr>
     * <tr>
     * <td>DISPLAY_DEVICE_VGA_COMPATIBLE</td>
     * <td>The device is VGA compatible.</td>
     * </tr>
     * </table>
     */
    StateFlags : DISPLAY_DEVICE_STATE_FLAGS

    /**
     * Not used.
     */
    DeviceID : WCHAR[128]

    /**
     * Reserved.
     */
    DeviceKey : WCHAR[128]

}
