#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the shape at the end of a line or segment.
 * @remarks
 * 
  * The following illustration shows the available cap styles for lines or segments. The red portion of the line shows the extra area added by the line cap setting.
  * 
  * 
  * 
  * <img alt="Illustration of four cap styles" src="./images/linecaps.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_cap_style
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CAP_STYLE{

    /**
     * A cap that does not extend past the last point of the line. Comparable to cap used for objects other than lines.
     * @type {Integer (Int32)}
     */
    static D2D1_CAP_STYLE_FLAT => 0

    /**
     * Half of a square that has a length equal to the line thickness.
     * @type {Integer (Int32)}
     */
    static D2D1_CAP_STYLE_SQUARE => 1

    /**
     * A semicircle that has a diameter equal to the line thickness.
     * @type {Integer (Int32)}
     */
    static D2D1_CAP_STYLE_ROUND => 2

    /**
     * An isosceles right triangle whose hypotenuse is equal in length to the thickness of the line.
     * @type {Integer (Int32)}
     */
    static D2D1_CAP_STYLE_TRIANGLE => 3
}
