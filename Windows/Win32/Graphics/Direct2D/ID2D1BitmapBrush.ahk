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
     * 
     * @param {Integer} extendModeX 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(8, this, "int", extendModeX)
    }

    /**
     * 
     * @param {Integer} extendModeY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(9, this, "int", extendModeY)
    }

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setinterpolationmode
     */
    SetInterpolationMode(interpolationMode) {
        ComCall(10, this, "int", interpolationMode)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setbitmap
     */
    SetBitmap(bitmap) {
        ComCall(11, this, "ptr", bitmap)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getbitmap
     */
    GetBitmap(bitmap) {
        ComCall(15, this, "ptr*", bitmap)
    }
}
