#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DashCap enumeration specifies the type of graphic shape to use on both ends of each dash in a dashed line.
 * @remarks
 * 
 * If you set the alignment of a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspen/nl-gdipluspen-pen">Pen</a> object to <b>PenAlignmentInset</b>, you cannot use that pen to draw triangular dash caps.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-dashcap
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DashCap{

    /**
     * Specifies a square cap that squares off both ends of each dash.
     * @type {Integer (Int32)}
     */
    static DashCapFlat => 0

    /**
     * Specifies a circular cap that rounds off both ends of each dash.
     * @type {Integer (Int32)}
     */
    static DashCapRound => 2

    /**
     * Specifies a triangular cap that points both ends of each dash.
     * @type {Integer (Int32)}
     */
    static DashCapTriangle => 3
}
