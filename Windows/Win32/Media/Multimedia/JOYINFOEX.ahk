#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The JOYINFOEX structure contains extended information about the joystick position, point-of-view position, and button state.
 * @remarks
 * The value of the <b>dwSize</b> member is also used to identify the version number for the structure when it's passed to the <a href="https://docs.microsoft.com/previous-versions/dd757108(v=vs.85)">joyGetPosEx</a> function.
 * 
 * Most devices with a point-of-view control have only five positions. When the JOY_RETURNPOV flag is set, these positions are reported by using the following constants:
 * 
 * <table>
 * <tr>
 * <th>Point-Of-View Flag
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>JOY_POVBACKWARD</td>
 * <td>Point-of-view hat is pressed backward. The value 18,000 represents an orientation of 180.00 degrees (to the rear).</td>
 * </tr>
 * <tr>
 * <td>JOY_POVCENTERED</td>
 * <td>Point-of-view hat is in the neutral position. The value -1 means the point-of-view hat has no angle to report.</td>
 * </tr>
 * <tr>
 * <td>JOY_POVFORWARD</td>
 * <td>Point-of-view hat is pressed forward. The value 0 represents an orientation of 0.00 degrees (straight ahead).</td>
 * </tr>
 * <tr>
 * <td>JOY_POVLEFT</td>
 * <td>Point-of-view hat is being pressed to the left. The value 27,000 represents an orientation of 270.00 degrees (90.00 degrees to the left).</td>
 * </tr>
 * <tr>
 * <td>JOY_POVRIGHT</td>
 * <td>Point-of-view hat is pressed to the right. The value 9,000 represents an orientation of 90.00 degrees (to the right).</td>
 * </tr>
 * </table>
 *  
 * 
 * The default joystick driver currently supports these five discrete directions. If an application can accept only the defined point-of-view values, it must use the JOY_RETURNPOV flag. If an application can accept other degree readings, it should use the JOY_RETURNPOVCTS flag to obtain continuous data if it is available. The JOY_RETURNPOVCTS flag also supports the JOY_POV constants used with the JOY_RETURNPOV flag.
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/ns-joystickapi-joyinfoex
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct JOYINFOEX {
    #StructPack 4

    /**
     * Size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * Flags indicating the valid information returned in this structure. Members that do not contain valid information are set to zero. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>JOY_RETURNALL</td>
     * <td>Equivalent to setting all of the JOY_RETURN bits except JOY_RETURNRAWDATA.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNBUTTONS</td>
     * <td>The <b>dwButtons</b> member contains valid information about the state of each joystick button.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNCENTERED</td>
     * <td>Centers the joystick neutral position to the middle value of each axis of movement.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNPOV</td>
     * <td>The <b>dwPOV</b> member contains valid information about the point-of-view control, expressed in discrete units.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNPOVCTS</td>
     * <td>The <b>dwPOV</b> member contains valid information about the point-of-view control expressed in continuous, one-hundredth degree units.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNR</td>
     * <td>The <b>dwRpos</b> member contains valid rudder pedal data. This information represents another (fourth) axis.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNRAWDATA</td>
     * <td>Data stored in this structure is uncalibrated joystick readings.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNU</td>
     * <td>The <b>dwUpos</b> member contains valid data for a fifth axis of the joystick, if such an axis is available, or returns zero otherwise.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNV</td>
     * <td>The <b>dwVpos</b> member contains valid data for a sixth axis of the joystick, if such an axis is available, or returns zero otherwise.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNX</td>
     * <td>The <b>dwXpos</b> member contains valid data for the x-coordinate of the joystick.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNY</td>
     * <td>The <b>dwYpos</b> member contains valid data for the y-coordinate of the joystick.</td>
     * </tr>
     * <tr>
     * <td>JOY_RETURNZ</td>
     * <td>The <b>dwZpos</b> member contains valid data for the z-coordinate of the joystick.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags provide data to calibrate a joystick and are intended for custom calibration applications.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READ3</td>
     * <td>Read the x-, y-, and z-coordinates and store the raw values in <b>dwXpos</b>, <b>dwYpos</b>, and <b>dwZpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READ4</td>
     * <td>Read the rudder information and the x-, y-, and z-coordinates and store the raw values in <b>dwXpos</b>, <b>dwYpos</b>, <b>dwZpos</b>, and <b>dwRpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READ5</td>
     * <td>Read the rudder information and the x-, y-, z-, and u-coordinates and store the raw values in <b>dwXpos</b>, <b>dwYpos</b>, <b>dwZpos</b>, <b>dwRpos</b>, and <b>dwUpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READ6</td>
     * <td>Read the raw v-axis data if a joystick mini driver is present that will provide the data. Returns zero otherwise.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READALWAYS</td>
     * <td>Read the joystick port even if the driver does not detect a device.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READRONLY</td>
     * <td>Read the rudder information if a joystick mini-driver is present that will provide the data and store the raw value in <b>dwRpos</b>. Return zero otherwise.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READXONLY</td>
     * <td>Read the x-coordinate and store the raw (uncalibrated) value in <b>dwXpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READXYONLY</td>
     * <td>Reads the x- and y-coordinates and place the raw values in <b>dwXpos</b> and <b>dwYpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READYONLY</td>
     * <td>Reads the y-coordinate and store the raw value in <b>dwYpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READZONLY</td>
     * <td>Read the z-coordinate and store the raw value in <b>dwZpos</b>.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READUONLY</td>
     * <td>Read the u-coordinate if a joystick mini-driver is present that will provide the data and store the raw value in <b>dwUpos</b>. Return zero otherwise.</td>
     * </tr>
     * <tr>
     * <td>JOY_CAL_READVONLY</td>
     * <td>Read the v-coordinate if a joystick mini-driver is present that will provide the data and store the raw value in <b>dwVpos</b>. Return zero otherwise.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Current X-coordinate.
     */
    dwXpos : UInt32

    /**
     * Current Y-coordinate.
     */
    dwYpos : UInt32

    /**
     * Current Z-coordinate.
     */
    dwZpos : UInt32

    /**
     * Current position of the rudder or fourth joystick axis.
     */
    dwRpos : UInt32

    /**
     * Current fifth axis position.
     */
    dwUpos : UInt32

    /**
     * Current sixth axis position.
     */
    dwVpos : UInt32

    /**
     * Current state of the 32 joystick buttons. The value of this member can be set to any combination of JOY_BUTTON <i>n</i> flags, where <i>n</i> is a value in the range of 1 through 32 corresponding to the button that is pressed.
     */
    dwButtons : UInt32

    /**
     * Current button number that is pressed.
     */
    dwButtonNumber : UInt32

    /**
     * Current position of the point-of-view control. Values for this member are in the range 0 through 35,900. These values represent the angle, in degrees, of each view multiplied by 100.
     */
    dwPOV : UInt32

    /**
     * Reserved; do not use.
     */
    dwReserved1 : UInt32

    /**
     * Reserved; do not use.
     */
    dwReserved2 : UInt32

}
