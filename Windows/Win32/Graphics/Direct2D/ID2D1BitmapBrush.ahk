#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Brush.ahk

/**
 * Paints an area with a bitmap.
 * @remarks
 * 
 * A bitmap brush is used to fill a geometry with a bitmap. Like all brushes, it defines an infinite plane of content. Because bitmaps are finite, the brush relies on an "extend mode" to determine how the plane is filled horizontally and vertically.
 * 
 * <h3><a id="Creating_ID2D1BitmapBrush_Objects"></a><a id="creating_id2d1bitmapbrush_objects"></a><a id="CREATING_ID2D1BITMAPBRUSH_OBJECTS"></a>Creating ID2D1BitmapBrush Objects</h3>
 * To create a bitmap brush, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapbrush">ID2D1RenderTarget::CreateBitmapBrush</a> method.
 * 
 * An <b>ID2D1BitmapBrush</b> is a device-dependent resource: your application should create bitmap brushes after it initializes the render target with which the bitmap brush will be used, and recreate the bitmap brush whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1bitmapbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BitmapBrush extends ID2D1Brush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BitmapBrush
     * @type {Guid}
     */
    static IID => Guid("{2cd906aa-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExtendModeX", "SetExtendModeY", "SetInterpolationMode", "SetBitmap", "GetExtendModeX", "GetExtendModeY", "GetInterpolationMode", "GetBitmap"]

    /**
     * Specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @remarks
     * 
     * Sometimes, the  bitmap for a bitmap brush doesn't completely fill the area being painted. When this happens, Direct2D uses the brush's horizontal (<b>SetExtendModeX</b>) and vertical (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodey">SetExtendModeY</a>) extend mode settings to determine how to fill the remaining area.
     * 
     * The following illustration shows the results from  every  possible combination of the extend modes for an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a>: <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE_CLAMP</a> (CLAMP), <b>D2D1_EXTEND_MODE_WRAP</b> (WRAP), and <b>D2D1_EXTEND_MIRROR</b> (MIRROR).
     * 
     * <img alt="Illustration of a bitmap and the resulting images from various extend modes" src="./images/bitmapwrap_clamp_mirror.png"/>
     * 
     * 
     * 
     * @param {Integer} extendModeX Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(8, this, "int", extendModeX)
    }

    /**
     * Specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @remarks
     * 
     * Sometimes, the  bitmap for a bitmap brush doesn't completely fill the area being painted. When this happens, Direct2D uses the brush's horizontal (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodex">SetExtendModeX</a>) and vertical (<b>SetExtendModeY</b>) extend mode settings to determine how to fill the remaining area.
     * 
     * The following illustration shows the results from  every  possible combination of the extend modes for an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a>: <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE_CLAMP</a> (CLAMP), <b>D2D1_EXTEND_MODE_WRAP</b> (WRAP), and <b>D2D1_EXTEND_MIRROR</b> (MIRROR).
     * 
     * <img alt="Illustration of a bitmap and the resulting images from various extend modes" src="./images/bitmapwrap_clamp_mirror.png"/>
     * 
     * 
     * 
     * @param {Integer} extendModeY Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(9, this, "int", extendModeY)
    }

    /**
     * Specifies the interpolation mode used when the brush bitmap is scaled or rotated.
     * @remarks
     * 
     * This method sets the interpolation mode for a bitmap, which is an enum value that is specified in the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a> enumeration type.   D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR represents nearest neighbor filtering. It looks up the nearest bitmap pixel to the current rendering pixel and chooses its exact color. D2D1_BITMAP_INTERPOLATION_MODE_LINEAR represents linear filtering, and  interpolates a color from the four nearest bitmap pixels.
     * 
     * The interpolation mode of a bitmap also affects subpixel translations. In a subpixel translation, bilinear interpolation positions the bitmap more precisely to the application requests, but blurs the bitmap in the process.
     * 
     * 
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode used when the brush bitmap is scaled or rotated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-setinterpolationmode
     */
    SetInterpolationMode(interpolationMode) {
        ComCall(10, this, "int", interpolationMode)
    }

    /**
     * Specifies the bitmap source that this brush uses to paint.
     * @remarks
     * 
     * This method specifies the bitmap source that this brush uses to paint. The bitmap is not resized or rescaled automatically to fit the geometry that it fills. The bitmap stays at its native size. To resize or translate the bitmap, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-settransform(constd2d1_matrix_3x2_f)">SetTransform</a> method to apply  a transform to the brush. 
     * 
     * The native size of a bitmap is the width and height in bitmap pixels, divided by the bitmap DPI. This native size forms the base tile of the brush. To tile a subregion of the bitmap, you must generate a new bitmap containing this subregion and use <b>SetBitmap</b> to apply it to the brush.
     * 
     * 
     * @param {ID2D1Bitmap} bitmap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap source used by the brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-setbitmap
     */
    SetBitmap(bitmap) {
        ComCall(11, this, "ptr", bitmap)
    }

    /**
     * Gets the method by which the brush horizontally tiles those areas that extend past its bitmap.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * Gets the method by which the brush vertically tiles those areas that extend past its bitmap.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * Gets the interpolation method used when the brush bitmap is scaled or rotated.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation method used when the brush bitmap is scaled or rotated.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * Gets the bitmap source that this brush uses to paint.
     * @param {Pointer<ID2D1Bitmap>} bitmap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>**</b>
     * 
     * When this method returns, contains the address to a pointer to the bitmap with which this brush paints.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1bitmapbrush-getbitmap
     */
    GetBitmap(bitmap) {
        ComCall(15, this, "ptr*", bitmap)
    }
}
