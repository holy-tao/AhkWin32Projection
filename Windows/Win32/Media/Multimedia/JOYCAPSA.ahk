#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The JOYCAPS structure contains information about the joystick capabilities. (JOYCAPSA)
 * @remarks
 * > [!NOTE]
  * > The joystickapi.h header defines JOYCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/ns-joystickapi-joycapsa
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class JOYCAPSA extends Win32Struct
{
    static sizeof => 404

    static packingSize => 4

    /**
     * Manufacturer identifier. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Null-terminated string containing the joystick product name.
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 4, 31, "UTF-8")
        set => StrPut(value, this.ptr + 4, 31, "UTF-8")
    }

    /**
     * Minimum X-coordinate.
     * @type {Integer}
     */
    wXmin {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Maximum X-coordinate.
     * @type {Integer}
     */
    wXmax {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Minimum Y-coordinate.
     * @type {Integer}
     */
    wYmin {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Maximum Y-coordinate.
     * @type {Integer}
     */
    wYmax {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Minimum Z-coordinate.
     * @type {Integer}
     */
    wZmin {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Maximum Z-coordinate.
     * @type {Integer}
     */
    wZmax {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of joystick buttons.
     * @type {Integer}
     */
    wNumButtons {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Smallest polling frequency supported when captured by the <a href="https://docs.microsoft.com/previous-versions/dd757114(v=vs.85)">joySetCapture</a> function.
     * @type {Integer}
     */
    wPeriodMin {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Largest polling frequency supported when captured by <b>joySetCapture</b>.
     * @type {Integer}
     */
    wPeriodMax {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Minimum rudder value. The rudder is a fourth axis of movement.
     * @type {Integer}
     */
    wRmin {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Maximum rudder value. The rudder is a fourth axis of movement.
     * @type {Integer}
     */
    wRmax {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Minimum u-coordinate (fifth axis) values.
     * @type {Integer}
     */
    wUmin {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Maximum u-coordinate (fifth axis) values.
     * @type {Integer}
     */
    wUmax {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Minimum v-coordinate (sixth axis) values.
     * @type {Integer}
     */
    wVmin {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Maximum v-coordinate (sixth axis) values.
     * @type {Integer}
     */
    wVmax {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Joystick capabilities The following flags define individual capabilities that a joystick might have:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>JOYCAPS_HASZ</td>
     * <td>Joystick has z-coordinate information.</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_HASR</td>
     * <td>Joystick has rudder (fourth axis) information.</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_HASU</td>
     * <td>Joystick has u-coordinate (fifth axis) information.</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_HASV</td>
     * <td>Joystick has v-coordinate (sixth axis) information.</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_HASPOV</td>
     * <td>Joystick has point-of-view information.</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_POV4DIR</td>
     * <td>Joystick point-of-view supports discrete values (centered, forward, backward, left, and right).</td>
     * </tr>
     * <tr>
     * <td>JOYCAPS_POVCTS</td>
     * <td>Joystick point-of-view supports continuous degree bearings.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wCaps {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Maximum number of axes supported by the joystick.
     * @type {Integer}
     */
    wMaxAxes {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Number of axes currently in use by the joystick.
     * @type {Integer}
     */
    wNumAxes {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Maximum number of buttons supported by the joystick.
     * @type {Integer}
     */
    wMaxButtons {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Null-terminated string containing the registry key for the joystick.
     * @type {String}
     */
    szRegKey {
        get => StrGet(this.ptr + 112, 31, "UTF-8")
        set => StrPut(value, this.ptr + 112, 31, "UTF-8")
    }

    /**
     * Null-terminated string identifying the joystick driver OEM.
     * @type {String}
     */
    szOEMVxD {
        get => StrGet(this.ptr + 144, 259, "UTF-8")
        set => StrPut(value, this.ptr + 144, 259, "UTF-8")
    }
}
