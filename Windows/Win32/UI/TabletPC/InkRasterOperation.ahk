#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for performing raster operations on drawn ink.
 * @remarks
 * 
 * Use these values to set the value for the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation">RasterOperation</a> drawing attribute. Any object with a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property can have this value set.
 * 
 * <div class="alert"><b>Note</b>  Many printers do not support many of the available raster operations. Because of this, the colors you see on the display may be different from the colors that you would see if they were printed on paper. This is directly related to the printer drivers or printer hardware. You may need to experiment to determine which printers can produce the correct output when various raster operations are set on ink.</div>
 * <div> </div>
 * When the <b>RasterOperation</b> value is set to anything other than CopyPen, all drawing attributes (anti-aliasing, smoothing, transparency, and pressure) are ignored.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkrasteroperation
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRasterOperation{

    /**
     * Black pen color.
     * @type {Integer (Int32)}
     */
    static IRO_Black => 1

    /**
     * The  inverse of MergePen.
     * @type {Integer (Int32)}
     */
    static IRO_NotMergePen => 2

    /**
     * A combination of the colors that are common to the background color and the inverse of the pen.
     * @type {Integer (Int32)}
     */
    static IRO_MaskNotPen => 3

    /**
     * The inverse of CopyPen.
     * @type {Integer (Int32)}
     */
    static IRO_NotCopyPen => 4

    /**
     * A combination of the colors that are common to both the pen and the inverse of the display.
     * @type {Integer (Int32)}
     */
    static IRO_MaskPenNot => 5

    /**
     * The inverse of the display color.
     * @type {Integer (Int32)}
     */
    static IRO_Not => 6

    /**
     * A combination of the colors in the pen and in the display color, but not in both.
     * @type {Integer (Int32)}
     */
    static IRO_XOrPen => 7

    /**
     * The inverse of MaskPen.
     * @type {Integer (Int32)}
     */
    static IRO_NotMaskPen => 8

    /**
     * A combination of the colors that are common to both the pen and the display.
     * @type {Integer (Int32)}
     */
    static IRO_MaskPen => 9

    /**
     * An inverse of XOrPen.
     * @type {Integer (Int32)}
     */
    static IRO_NotXOrPen => 10

    /**
     * No operation; the output remains unchanged.
     * @type {Integer (Int32)}
     */
    static IRO_NoOperation => 11

    /**
     * A combination of the display color and the inverse of the pen color.
     * @type {Integer (Int32)}
     */
    static IRO_MergeNotPen => 12

    /**
     * The pen color.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static IRO_CopyPen => 13

    /**
     * A combination of the pen color and the inverse of the display color.
     * @type {Integer (Int32)}
     */
    static IRO_MergePenNot => 14

    /**
     * A combination of the pen color and the display color.
     * @type {Integer (Int32)}
     */
    static IRO_MergePen => 15

    /**
     * A white pen color.
     * @type {Integer (Int32)}
     */
    static IRO_White => 16
}
