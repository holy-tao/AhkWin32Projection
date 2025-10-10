#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of pointer shape.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ne-dxgi1_2-dxgi_outdupl_pointer_shape_type
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_POINTER_SHAPE_TYPE{

    /**
     * The pointer type is a monochrome mouse pointer, which is  a monochrome bitmap. The bitmap's size is specified by width and height in a 1 bits per pixel (bpp) device independent bitmap (DIB) format AND mask that is followed by another 1 bpp DIB format XOR mask of the same size.
     * @type {Integer (Int32)}
     */
    static DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME => 1

    /**
     * The pointer type is a color mouse pointer, which is  a color bitmap. The bitmap's size is specified by width and height in a 32 bpp ARGB DIB format.
     * @type {Integer (Int32)}
     */
    static DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR => 2

    /**
     * The pointer type is a masked color mouse pointer.  A masked color mouse pointer is a 32 bpp ARGB format bitmap with the mask value in the alpha bits. The only allowed mask values are 0 and 0xFF. When the mask value is 0, the RGB value should replace the screen pixel. When the mask value is 0xFF, an XOR operation is performed on the RGB value and the screen pixel; the result replaces the screen pixel.
     * @type {Integer (Int32)}
     */
    static DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR => 4
}
