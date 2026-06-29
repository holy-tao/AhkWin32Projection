#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_BITMAP_INTERPOLATION_MODE.ahk" { D2D1_BITMAP_INTERPOLATION_MODE }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * Paints an area with a bitmap. (ID2D1BitmapBrush)
 * @remarks
 * A bitmap brush is used to fill a geometry with a bitmap. Like all brushes, it defines an infinite plane of content. Because bitmaps are finite, the brush relies on an "extend mode" to determine how the plane is filled horizontally and vertically.
 * 
 * <h3><a id="Creating_ID2D1BitmapBrush_Objects"></a><a id="creating_id2d1bitmapbrush_objects"></a><a id="CREATING_ID2D1BITMAPBRUSH_OBJECTS"></a>Creating ID2D1BitmapBrush Objects</h3>
 * To create a bitmap brush, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapbrush">ID2D1RenderTarget::CreateBitmapBrush</a> method.
 * 
 * An <b>ID2D1BitmapBrush</b> is a device-dependent resource: your application should create bitmap brushes after it initializes the render target with which the bitmap brush will be used, and recreate the bitmap brush whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BitmapBrush extends ID2D1Brush {
    /**
     * The interface identifier for ID2D1BitmapBrush
     * @type {Guid}
     */
    static IID := Guid("{2cd906aa-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BitmapBrush interfaces
    */
    struct Vtbl extends ID2D1Brush.Vtbl {
        SetExtendModeX       : IntPtr
        SetExtendModeY       : IntPtr
        SetInterpolationMode : IntPtr
        SetBitmap            : IntPtr
        GetExtendModeX       : IntPtr
        GetExtendModeY       : IntPtr
        GetInterpolationMode : IntPtr
        GetBitmap            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BitmapBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @remarks
     * Sometimes, the  bitmap for a bitmap brush doesn't completely fill the area being painted. When this happens, Direct2D uses the brush's horizontal (<b>SetExtendModeX</b>) and vertical (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodey">SetExtendModeY</a>) extend mode settings to determine how to fill the remaining area.
     * 
     * The following illustration shows the results from  every  possible combination of the extend modes for an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a>: <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE_CLAMP</a> (CLAMP), <b>D2D1_EXTEND_MODE_WRAP</b> (WRAP), and <b>D2D1_EXTEND_MIRROR</b> (MIRROR).
     * 
     * <img alt="Illustration of a bitmap and the resulting images from various extend modes" src="./images/bitmapwrap_clamp_mirror.png"/>
     * @param {D2D1_EXTEND_MODE} extendModeX Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(8, this, D2D1_EXTEND_MODE, extendModeX)
    }

    /**
     * Specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @remarks
     * Sometimes, the  bitmap for a bitmap brush doesn't completely fill the area being painted. When this happens, Direct2D uses the brush's horizontal (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodex">SetExtendModeX</a>) and vertical (<b>SetExtendModeY</b>) extend mode settings to determine how to fill the remaining area.
     * 
     * The following illustration shows the results from  every  possible combination of the extend modes for an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a>: <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE_CLAMP</a> (CLAMP), <b>D2D1_EXTEND_MODE_WRAP</b> (WRAP), and <b>D2D1_EXTEND_MIRROR</b> (MIRROR).
     * 
     * <img alt="Illustration of a bitmap and the resulting images from various extend modes" src="./images/bitmapwrap_clamp_mirror.png"/>
     * @param {D2D1_EXTEND_MODE} extendModeY Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(9, this, D2D1_EXTEND_MODE, extendModeY)
    }

    /**
     * Specifies the interpolation mode used when the brush bitmap is scaled or rotated.
     * @remarks
     * This method sets the interpolation mode for a bitmap, which is an enum value that is specified in the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a> enumeration type.   D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR represents nearest neighbor filtering. It looks up the nearest bitmap pixel to the current rendering pixel and chooses its exact color. D2D1_BITMAP_INTERPOLATION_MODE_LINEAR represents linear filtering, and  interpolates a color from the four nearest bitmap pixels.
     * 
     * The interpolation mode of a bitmap also affects subpixel translations. In a subpixel translation, bilinear interpolation positions the bitmap more precisely to the application requests, but blurs the bitmap in the process.
     * @param {D2D1_BITMAP_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode used when the brush bitmap is scaled or rotated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setinterpolationmode
     */
    SetInterpolationMode(_interpolationMode) {
        ComCall(10, this, D2D1_BITMAP_INTERPOLATION_MODE, _interpolationMode)
    }

    /**
     * Specifies the bitmap source that this brush uses to paint.
     * @remarks
     * This method specifies the bitmap source that this brush uses to paint. The bitmap is not resized or rescaled automatically to fit the geometry that it fills. The bitmap stays at its native size. To resize or translate the bitmap, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-settransform(constd2d1_matrix_3x2_f)">SetTransform</a> method to apply  a transform to the brush. 
     * 
     * The native size of a bitmap is the width and height in bitmap pixels, divided by the bitmap DPI. This native size forms the base tile of the brush. To tile a subregion of the bitmap, you must generate a new bitmap containing this subregion and use <b>SetBitmap</b> to apply it to the brush.
     * @param {ID2D1Bitmap} _bitmap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap source used by the brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-setbitmap
     */
    SetBitmap(_bitmap) {
        ComCall(11, this, "ptr", _bitmap)
    }

    /**
     * Gets the method by which the brush horizontally tiles those areas that extend past its bitmap.
     * @remarks
     * Like all brushes, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> defines an infinite plane of content. Because bitmaps are finite, it relies on an extend mode to determine how the plane is filled horizontally and vertically.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush horizontally tiles those areas that extend past its bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(12, this, D2D1_EXTEND_MODE)
        return result
    }

    /**
     * Gets the method by which the brush vertically tiles those areas that extend past its bitmap.
     * @remarks
     * Like all brushes, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> defines an infinite plane of content. 
     * 
     *  Because bitmaps are finite, it relies on an extend mode to determine how the plane is filled horizontally and vertically.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that specifies how the brush vertically tiles those areas that extend past its bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(13, this, D2D1_EXTEND_MODE)
        return result
    }

    /**
     * Gets the interpolation method used when the brush bitmap is scaled or rotated.
     * @remarks
     * This method gets the interpolation mode of a bitmap, which is specified by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a> enumeration type.   <b>D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR</b> represents nearest neighbor filtering. It looks up the bitmap pixel nearest to the current rendering pixel and chooses its exact color. <b>D2D1_BITMAP_INTERPOLATION_MODE_LINEAR</b> represents linear filtering, and  interpolates a color from the four nearest bitmap pixels.
     * 
     * The interpolation mode of a bitmap also affects subpixel translations. In a subpixel translation, linear interpolation positions the bitmap more precisely to the application request, but blurs the bitmap in the process.
     * @returns {D2D1_BITMAP_INTERPOLATION_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation method used when the brush bitmap is scaled or rotated.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(14, this, D2D1_BITMAP_INTERPOLATION_MODE)
        return result
    }

    /**
     * Gets the bitmap source that this brush uses to paint.
     * @param {Pointer<ID2D1Bitmap>} _bitmap Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>**</b>
     * 
     * When this method returns, contains the address to a pointer to the bitmap with which this brush paints.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1bitmapbrush-getbitmap
     */
    GetBitmap(_bitmap) {
        ComCall(15, this, ID2D1Bitmap.Ptr, _bitmap)
    }

    Query(iid) {
        if (ID2D1BitmapBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetExtendModeX := CallbackCreate(GetMethod(implObj, "SetExtendModeX"), flags, 2)
        this.vtbl.SetExtendModeY := CallbackCreate(GetMethod(implObj, "SetExtendModeY"), flags, 2)
        this.vtbl.SetInterpolationMode := CallbackCreate(GetMethod(implObj, "SetInterpolationMode"), flags, 2)
        this.vtbl.SetBitmap := CallbackCreate(GetMethod(implObj, "SetBitmap"), flags, 2)
        this.vtbl.GetExtendModeX := CallbackCreate(GetMethod(implObj, "GetExtendModeX"), flags, 1)
        this.vtbl.GetExtendModeY := CallbackCreate(GetMethod(implObj, "GetExtendModeY"), flags, 1)
        this.vtbl.GetInterpolationMode := CallbackCreate(GetMethod(implObj, "GetInterpolationMode"), flags, 1)
        this.vtbl.GetBitmap := CallbackCreate(GetMethod(implObj, "GetBitmap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetExtendModeX)
        CallbackFree(this.vtbl.SetExtendModeY)
        CallbackFree(this.vtbl.SetInterpolationMode)
        CallbackFree(this.vtbl.SetBitmap)
        CallbackFree(this.vtbl.GetExtendModeX)
        CallbackFree(this.vtbl.GetExtendModeY)
        CallbackFree(this.vtbl.GetInterpolationMode)
        CallbackFree(this.vtbl.GetBitmap)
    }
}
