#Requires AutoHotkey v2.0.0 64-bit

/**
 * The LineJoin enumeration specifies how to join two lines that are drawn by the same pen and whose ends meet. At the intersection of the two line ends, a line join makes the join look more continuous.
 * @remarks
 * 
  * The miter length is the distance from the intersection of the line walls on the inside of the join to the intersection of the line walls outside of the join. The miter length can be large when the angle between two lines is small. The miter limit is the maximum allowed ratio of miter length to stroke width. The default value is 10.0f.
  * 
  * When using <b><b>LineJoinMiter</b></b> and the actual ratio exceeds the miter limit, the corner is clipped perpendicular to the miter at a distance from the inner corner that is the product of the miter limit and the pen width. 
  * 
  * <img alt="Illustration showing two lines with a corner that is clipped: the outside walls of the lines do not meet at a point" src="./images/linejoinmiter.png"/>
  * When using <b><b>LineJoinMiterClipped</b></b> and the miter limit is exceeded, the join is drawn as if its type were <b><b>LineJoinBevel</b></b>; that is, when the line walls on the inside of the join meet, then a joining line is drawn between the line walls on the outside of the join.
  * 
  * <img alt="Illustration showing two lines with a corner that is beveled" src="./images/linejoinbevel.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-linejoin
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LineJoin{

    /**
     * Specifies a mitered join. This produces a sharp corner or a clipped corner, depending on whether the length of the miter exceeds the miter limit.
     * @type {Integer (Int32)}
     */
    static LineJoinMiter => 0

    /**
     * Specifies a beveled join. This produces a diagonal corner.
     * @type {Integer (Int32)}
     */
    static LineJoinBevel => 1

    /**
     * Specifies a circular join. This produces a smooth, circular arc between the lines.
     * @type {Integer (Int32)}
     */
    static LineJoinRound => 2

    /**
     * Specifies a mitered join. This produces a sharp corner or a beveled corner, depending on whether the length of the miter exceeds the miter limit.
     * @type {Integer (Int32)}
     */
    static LineJoinMiterClipped => 3
}
