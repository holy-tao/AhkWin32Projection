#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Defines an object that paints an area. Interfaces that derive from ID2D1Brush describe how the area is painted.
 * @remarks
 * An <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> is a device-dependent resource: your application should create bitmap brushes after it initializes the render target with which the bitmap brush will be used, and recreate the bitmap brush whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * 
 * Brush space in Direct2D is specified differently than in XPS and Windows Presentation Foundation (WPF). In Direct2D, brush space is not relative to the object being drawn, but rather is the current coordinate system of the render target, transformed by the brush transform, if present. To paint an object as it would be painted by a WPF brush, you must translate the brush space origin to the upper-left corner of the object's bounding box, and then scale the brush space so that the base tile fills the bounding box of the object.
 * 
 * For more information about brushes, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-brushes-overview">Brushes Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Brush extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Brush
     * @type {Guid}
     */
    static IID := Guid("{2cd906a8-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Brush interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        SetOpacity   : IntPtr
        SetTransform : IntPtr
        GetOpacity   : IntPtr
        GetTransform : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Brush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the degree of opacity of this brush.
     * @param {Float} opacity Type: <b>FLOAT</b>
     * 
     * A value between zero and 1 that indicates the opacity of the brush. This value is a constant multiplier that linearly scales the alpha value of all pixels filled by the brush. The opacity values are clamped in the range 0–1 before they are multiplied together.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-setopacity
     */
    SetOpacity(opacity) {
        ComCall(4, this, "float", opacity)
    }

    /**
     * Sets the transformation applied to the brush.
     * @remarks
     * When you paint with a brush, it paints in the coordinate space of the render target. Brushes do not automatically position themselves to align with the object being painted; by default, they begin painting at the origin (0, 0) of the render target.
     * 
     * You can "move" the gradient defined by an [**ID2D1LinearGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush) to a target area by setting its start point and end point. Likewise, you can move the gradient defined by an [**ID2D1RadialGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush) by changing its center and radii.
     * 
     * To align the content of an [**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush) to the area being painted, you can use the **SetTransform** method to translate the bitmap to the desired location. This transform only affects the brush; it does not affect any other content drawn by the render target.
     * 
     * The following illustrations show the effect of using an [**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush) to fill a rectangle located at (100, 100). The illustration on the left illustration shows the result of filling the rectangle without transforming the brush: the bitmap is drawn at the render target's origin. As a result, only a portion of the bitmap appears in the rectangle.
     * 
     * The illustration on the right shows the result of transforming the [**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush) so that its content is shifted 50 pixels to the right and 50 pixels down. The bitmap now fills the rectangle.
     * 
     * ![illustration of two squares, one painted with a bitmap without a transformed brush and one painted with a transformed brush](images/brushes-ovw-transform.png)
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1brush-settransform
     */
    SetTransform(transform) {
        ComCall(5, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    /**
     * Gets the degree of opacity of this brush.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A value between zero and 1 that indicates the opacity of the brush. This value is a constant multiplier that linearly scales the alpha value of all pixels filled by the brush. The opacity values are clamped in the range 0–1 before they are multiplied together.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-getopacity
     */
    GetOpacity() {
        result := ComCall(6, this, Float32)
        return result
    }

    /**
     * Gets the transform applied to this brush.
     * @remarks
     * When the brush transform is the identity matrix, the brush appears in the same coordinate space as the render target in which it is drawn.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The transform applied to this brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1brush-gettransform
     */
    GetTransform(transform) {
        ComCall(7, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    Query(iid) {
        if (ID2D1Brush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOpacity := CallbackCreate(GetMethod(implObj, "SetOpacity"), flags, 2)
        this.vtbl.SetTransform := CallbackCreate(GetMethod(implObj, "SetTransform"), flags, 2)
        this.vtbl.GetOpacity := CallbackCreate(GetMethod(implObj, "GetOpacity"), flags, 1)
        this.vtbl.GetTransform := CallbackCreate(GetMethod(implObj, "GetTransform"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOpacity)
        CallbackFree(this.vtbl.SetTransform)
        CallbackFree(this.vtbl.GetOpacity)
        CallbackFree(this.vtbl.GetTransform)
    }
}
