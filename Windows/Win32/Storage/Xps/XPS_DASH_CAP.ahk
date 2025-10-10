#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the style of a dash cap on a dashed stroke.
 * @remarks
 * 
  * In the following illustrations, each shaded area represents the dash cap that corresponds to each  type of <b>XPS_DASH_CAP</b>.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Example</th>
  * </tr>
  * <tr>
  * <td>XPS_DASH_CAP_FLAT</td>
  * <td><img alt="A diagram that illustrates the XPS_DASH_CAP_FLAT dash cap in a dashed stroke" src="./images/xps_dash_cap_flat_dash_caps.png"/></td>
  * </tr>
  * <tr>
  * <td>XPS_DASH_CAP_ROUND</td>
  * <td><img alt="A diagram that illustrates the XPS_DASH_CAP_ROUND dash cap in a dashed stroke" src="./images/xps_dash_cap_round_dash_caps.png"/></td>
  * </tr>
  * <tr>
  * <td>XPS_DASH_CAP_SQUARE</td>
  * <td><img alt="A diagram that illustrates the XPS_DASH_CAP_SQUARE dash cap in a dashed stroke" src="./images/xps_dash_cap_square_dash_caps.png"/></td>
  * </tr>
  * <tr>
  * <td>XPS_DASH_CAP_TRIANGLE</td>
  * <td><img alt="A diagram that illustrates the XPS_DASH_CAP_TRIANGLE dash cap in a dashed stroke" src="./images/xps_dash_cap_triangle_dash_caps.png"/></td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_DASH_CAP{

    /**
     * Flat-line cap.
     * @type {Integer (Int32)}
     */
    static XPS_DASH_CAP_FLAT => 1

    /**
     * Round-line cap.
     * @type {Integer (Int32)}
     */
    static XPS_DASH_CAP_ROUND => 2

    /**
     * Square-line cap.
     * @type {Integer (Int32)}
     */
    static XPS_DASH_CAP_SQUARE => 3

    /**
     * Triangular-line cap.
     * @type {Integer (Int32)}
     */
    static XPS_DASH_CAP_TRIANGLE => 4
}
