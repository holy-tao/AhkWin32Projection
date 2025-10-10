#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PenAlignment enumeration specifies the alignment of a pen relative to the stroke that is being drawn.
 * @remarks
 * 
  * If you set the alignment of a 
  * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspen/nl-gdipluspen-pen">Pen</a> object to <b><b>PenAlignmentInset</b></b>, you cannot use that pen to draw compound lines or triangular dash caps.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-penalignment
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PenAlignment{

    /**
     * Specifies that the pen is aligned on the center of the line that is drawn.
     * @type {Integer (Int32)}
     */
    static PenAlignmentCenter => 0

    /**
     * Specifies, when drawing a polygon, that the pen is aligned on the inside of the edge of the polygon.
     * @type {Integer (Int32)}
     */
    static PenAlignmentInset => 1
}
