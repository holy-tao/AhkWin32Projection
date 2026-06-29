#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The JOYCAPSW (Unicode) (joystickapi.h) structure contains information about the joystick capabilities.
 * @remarks
 * > [!NOTE]
 * > The joystickapi.h header defines JOYCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/ns-joystickapi-joycapsw
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct JOYCAPSW {
    #StructPack 4

    /**
     * Manufacturer identifier. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wMid : UInt16

    /**
     * Product identifier. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wPid : UInt16

    /**
     * Null-terminated string containing the joystick product name.
     */
    szPname : WCHAR[32]

    /**
     * Minimum X-coordinate.
     */
    wXmin : UInt32

    /**
     * Maximum X-coordinate.
     */
    wXmax : UInt32

    /**
     * Minimum Y-coordinate.
     */
    wYmin : UInt32

    /**
     * Maximum Y-coordinate.
     */
    wYmax : UInt32

    /**
     * Minimum Z-coordinate.
     */
    wZmin : UInt32

    /**
     * Maximum Z-coordinate.
     */
    wZmax : UInt32

    /**
     * Number of joystick buttons.
     */
    wNumButtons : UInt32

    /**
     * Smallest polling frequency supported when captured by the <a href="https://docs.microsoft.com/previous-versions/dd757114(v=vs.85)">joySetCapture</a> function.
     */
    wPeriodMin : UInt32

    /**
     * Largest polling frequency supported when captured by <b>joySetCapture</b>.
     */
    wPeriodMax : UInt32

    /**
     * Minimum rudder value. The rudder is a fourth axis of movement.
     */
    wRmin : UInt32

    /**
     * Maximum rudder value. The rudder is a fourth axis of movement.
     */
    wRmax : UInt32

    /**
     * Minimum u-coordinate (fifth axis) values.
     */
    wUmin : UInt32

    /**
     * Maximum u-coordinate (fifth axis) values.
     */
    wUmax : UInt32

    /**
     * Minimum v-coordinate (sixth axis) values.
     */
    wVmin : UInt32

    /**
     * Maximum v-coordinate (sixth axis) values.
     */
    wVmax : UInt32

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
     */
    wCaps : UInt32

    /**
     * Maximum number of axes supported by the joystick.
     */
    wMaxAxes : UInt32

    /**
     * Number of axes currently in use by the joystick.
     */
    wNumAxes : UInt32

    /**
     * Maximum number of buttons supported by the joystick.
     */
    wMaxButtons : UInt32

    /**
     * Null-terminated string containing the registry key for the joystick.
     */
    szRegKey : WCHAR[32]

    /**
     * Null-terminated string identifying the joystick driver OEM.
     */
    szOEMVxD : WCHAR[260]

}
