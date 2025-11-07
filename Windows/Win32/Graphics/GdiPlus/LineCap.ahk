#Requires AutoHotkey v2.0.0 64-bit

/**
 * The LineCap enumeration specifies the type of graphic shape to use on the end of a line drawn with a Windows GDI+ pen.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-linecap
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LineCap{

    /**
     * Specifies that the line ends at the last point. The end is squared off.
     * @type {Integer (Int32)}
     */
    static LineCapFlat => 0

    /**
     * Specifies a square cap. The center of the square is the last point in the line. The height and width of the square are the line width.
     * @type {Integer (Int32)}
     */
    static LineCapSquare => 1

    /**
     * Specifies a circular cap. The center of the circle is the last point in the line. The diameter of the circle is the line width.
     * @type {Integer (Int32)}
     */
    static LineCapRound => 2

    /**
     * Specifies a triangular cap. The base of the triangle is the last point in the line. The base of the triangle is the line width.
     * @type {Integer (Int32)}
     */
    static LineCapTriangle => 3

    /**
     * Specifies that the line ends are not anchored.
     * @type {Integer (Int32)}
     */
    static LineCapNoAnchor => 16

    /**
     * Specifies that the line ends are anchored with a square. The center of the square is the last point in the line. The height and width of the square are the line width.
     * @type {Integer (Int32)}
     */
    static LineCapSquareAnchor => 17

    /**
     * Specifies that the line ends are anchored with a circle. The center of the circle is at the last point in the line. The circle is wider than the line.
     * @type {Integer (Int32)}
     */
    static LineCapRoundAnchor => 18

    /**
     * Specifies that the line ends are anchored with a diamond (a square turned at 45 degrees). The center of the diamond is at the last point in the line. The diamond is wider than the line.
     * @type {Integer (Int32)}
     */
    static LineCapDiamondAnchor => 19

    /**
     * Specifies that the line ends are anchored with arrowheads. The arrowhead point is located at the last point in the line. The arrowhead is wider than the line.
     * @type {Integer (Int32)}
     */
    static LineCapArrowAnchor => 20

    /**
     * Specifies that the line ends are made from a 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nl-gdiplusheaders-customlinecap">CustomLineCap</a>.
     * @type {Integer (Int32)}
     */
    static LineCapCustom => 255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static LineCapAnchorMask => 240
}
