#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the sequence of dashes and gaps in a stroke.
 * @remarks
 * The following illustration shows several available dash styles. 
  *       
  * 
  * <img alt="Illustration of available dash styles" src="./images/StrokeStyle_DashStyle.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DASH_STYLE{

    /**
     * A solid line with no breaks.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_SOLID => 0

    /**
     * A dash followed by a gap of equal length. The dash and the gap are each twice as long as the stroke thickness.
 * 
 * The equivalent dash  array for  <b>D2D1_DASH_STYLE_DASH</b> is {2, 2}.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_DASH => 1

    /**
     * A dot followed by a longer gap.
 * 
 * The equivalent dash  array for  <b>D2D1_DASH_STYLE_DOT</b> is {0, 2}.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_DOT => 2

    /**
     * A dash, followed by a gap, followed by a dot, followed by another gap.
 * 
 * The equivalent dash array for  <b>D2D1_DASH_STYLE_DASH_DOT</b> is {2, 2, 0, 2}.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_DASH_DOT => 3

    /**
     * A dash, followed by a gap, followed by a dot, followed by another gap, followed by another dot, followed by another gap.
 * 
 * The equivalent dash array for  <b>D2D1_DASH_STYLE_DASH_DOT_DOT</b> is {2, 2, 0, 2, 0, 2}.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_DASH_DOT_DOT => 4

    /**
     * The dash pattern is specified by an array of floating-point values.
     * @type {Integer (Int32)}
     */
    static D2D1_DASH_STYLE_CUSTOM => 5
}
