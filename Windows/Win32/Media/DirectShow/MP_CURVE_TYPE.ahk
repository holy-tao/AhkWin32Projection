#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MP_CURVE_TYPE enumeration defines the curve that a media parameter follows within an envelope segment.
 * @remarks
 * 
 * The following table lists the defined curves and their mathematical equivalents.
 * 
 * <table>
 * <tr>
 * <th>Value
 *             </th>
 * <th>Curve to Fit
 *             </th>
 * <th>Range
 *             </th>
 * </tr>
 * <tr>
 * <td>MP_CURVE_LINEAR</td>
 * <td><i>y</i> = <i>x</i></td>
 * <td>0.0 – 1.0</td>
 * </tr>
 * <tr>
 * <td>MP_CURVE_SQUARE</td>
 * <td><i>y</i> = <i>x</i>^2</td>
 * <td>0.0 – 1.0</td>
 * </tr>
 * <tr>
 * <td>MP_CURVE_INVSQUARE</td>
 * <td><i>y</i> = 1 –<i>x</i>^2</td>
 * <td>0.0 – 1.0</td>
 * </tr>
 * <tr>
 * <td>MP_CURVE_SINE</td>
 * <td><i>y</i> = sin(<i>x</i>)</td>
 * <td>–π/2 – π/2</td>
 * </tr>
 * </table>
 *  
 * 
 * For Boolean and enumeration parameters, only MP_CURVE_JUMP is valid.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//medparam/ne-medparam-mp_curve_type
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MP_CURVE_TYPE extends Win32Enum{

    /**
     * No interpolation. Jump to the next point.
     * @type {Integer (Int32)}
     */
    static MP_CURVE_JUMP => 1

    /**
     * Linear interpolation.
     * @type {Integer (Int32)}
     */
    static MP_CURVE_LINEAR => 2

    /**
     * Parabolic curve.
     * @type {Integer (Int32)}
     */
    static MP_CURVE_SQUARE => 4

    /**
     * Inverse square curve.
     * @type {Integer (Int32)}
     */
    static MP_CURVE_INVSQUARE => 8

    /**
     * Sine curve.
     * @type {Integer (Int32)}
     */
    static MP_CURVE_SINE => 16
}
