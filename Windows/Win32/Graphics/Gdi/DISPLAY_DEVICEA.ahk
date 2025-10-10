#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DISPLAY_DEVICE structure receives information about the display device specified by the iDevNum parameter of the EnumDisplayDevices function.
 * @remarks
 * 
  * The four string members are set based on the parameters passed to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. If the <i>lpDevice</i> param is <b>NULL</b>, then DISPLAY_DEVICE is filled in with information about the display adapter(s). If it is a valid device name, then it is filled in with information about the monitor(s) for that device.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wingdi.h header defines DISPLAY_DEVICE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-display_devicea
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset ANSI
 */
class DISPLAY_DEVICEA extends Win32Struct
{
    static sizeof => 424

    static packingSize => 4

    /**
     * Size, in bytes, of the <b>DISPLAY_DEVICE</b> structure. This must be initialized prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of characters identifying the device name. This is either the adapter device or the monitor device.
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 4, 31, "UTF-8")
        set => StrPut(value, this.ptr + 4, 31, "UTF-8")
    }

    /**
     * An array of characters containing the device context string. This is either a description of the display adapter or of the display monitor.
     * @type {String}
     */
    DeviceString {
        get => StrGet(this.ptr + 36, 127, "UTF-8")
        set => StrPut(value, this.ptr + 36, 127, "UTF-8")
    }

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
     * @type {Integer}
     */
    StateFlags {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Not used.
     * @type {String}
     */
    DeviceID {
        get => StrGet(this.ptr + 168, 127, "UTF-8")
        set => StrPut(value, this.ptr + 168, 127, "UTF-8")
    }

    /**
     * Reserved.
     * @type {String}
     */
    DeviceKey {
        get => StrGet(this.ptr + 296, 127, "UTF-8")
        set => StrPut(value, this.ptr + 296, 127, "UTF-8")
    }
}
