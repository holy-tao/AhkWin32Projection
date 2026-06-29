#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The XFORM structure specifies a world-space to page-space transformation.
 * @remarks
 * The following list describes how the members are used for each operation.
 * 
 * <table>
 * <tr>
 * <th>Operation</th>
 * <th>eM11</th>
 * <th>eM12</th>
 * <th>eM21</th>
 * <th>eM22</th>
 * </tr>
 * <tr>
 * <td>Rotation</td>
 * <td>Cosine</td>
 * <td>Sine</td>
 * <td>Negative sine</td>
 * <td>Cosine</td>
 * </tr>
 * <tr>
 * <td>Scaling</td>
 * <td>Horizontal scaling component</td>
 * <td>Not used</td>
 * <td>Not used</td>
 * <td>Vertical Scaling Component</td>
 * </tr>
 * <tr>
 * <td>Shear</td>
 * <td>Not used</td>
 * <td>Horizontal Proportionality Constant</td>
 * <td>Vertical Proportionality Constant</td>
 * <td>Not used</td>
 * </tr>
 * <tr>
 * <td>Reflection</td>
 * <td>Horizontal Reflection Component</td>
 * <td>Not used</td>
 * <td>Not used</td>
 * <td>Vertical Reflection Component</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-xform
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct XFORM {
    #StructPack 4

    /**
     * The following.
     * 
     * <table>
     * <tr>
     * <th>Operation</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>Scaling</td>
     * <td>Horizontal scaling component</td>
     * </tr>
     * <tr>
     * <td>Rotation</td>
     * <td>Cosine of rotation angle</td>
     * </tr>
     * <tr>
     * <td>Reflection</td>
     * <td>Horizontal component</td>
     * </tr>
     * </table>
     */
    eM11 : Float32

    /**
     * The following.
     * 
     * <table>
     * <tr>
     * <th>Operation</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>Shear</td>
     * <td>Horizontal proportionality constant</td>
     * </tr>
     * <tr>
     * <td>Rotation</td>
     * <td>Sine of the rotation angle</td>
     * </tr>
     * </table>
     */
    eM12 : Float32

    /**
     * The following.
     * 
     * <table>
     * <tr>
     * <th>Operation</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>Shear</td>
     * <td>Vertical proportionality constant</td>
     * </tr>
     * <tr>
     * <td>Rotation</td>
     * <td>Negative sine of the rotation angle</td>
     * </tr>
     * </table>
     */
    eM21 : Float32

    /**
     * The following.
     * 
     * <table>
     * <tr>
     * <th>Operation</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>Scaling</td>
     * <td>Vertical scaling component</td>
     * </tr>
     * <tr>
     * <td>Rotation</td>
     * <td>Cosine of rotation angle</td>
     * </tr>
     * <tr>
     * <td>Reflection</td>
     * <td>Vertical reflection component</td>
     * </tr>
     * </table>
     */
    eM22 : Float32

    /**
     * The horizontal translation component, in logical units.
     */
    eDx : Float32

    /**
     * The vertical translation component, in logical units.
     */
    eDy : Float32

}
