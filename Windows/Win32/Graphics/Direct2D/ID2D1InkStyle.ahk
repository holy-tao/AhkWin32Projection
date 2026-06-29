#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_INK_NIB_SHAPE.ahk" { D2D1_INK_NIB_SHAPE }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a collection of style properties to be used by methods like ID2D1DeviceContext2::DrawInk when rendering ink. The ink style defines the nib (pen tip) shape and transform.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1inkstyle
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1InkStyle extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1InkStyle
     * @type {Guid}
     */
    static IID := Guid("{bae8b344-23fc-4071-8cb5-d05d6f073848}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1InkStyle interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        SetNibTransform : IntPtr
        GetNibTransform : IntPtr
        SetNibShape     : IntPtr
        GetNibShape     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1InkStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the transform to apply to this style's nib shape. (overload 1/2)
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The transform to apply to this style’s nib shape. Note that the translation components of the transform matrix are ignored for the purposes of rendering.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1inkstyle-setnibtransform(constd2d1_matrix_3x2_f_)
     */
    SetNibTransform(transform) {
        ComCall(4, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    /**
     * Retrieves the transform to be applied to this style's nib shape.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this method returns, contains a pointer to the transform to be applied to this style's nib shape.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1inkstyle-getnibtransform
     */
    GetNibTransform(transform) {
        ComCall(5, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    /**
     * Sets the pre-transform nib shape for this style.
     * @param {D2D1_INK_NIB_SHAPE} nibShape Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape">D2D1_INK_NIB_SHAPE</a></b>
     * 
     * The pre-transform nib shape to use in this style.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1inkstyle-setnibshape
     */
    SetNibShape(nibShape) {
        ComCall(6, this, D2D1_INK_NIB_SHAPE, nibShape)
    }

    /**
     * Retrieves the pre-transform nib shape for this style.
     * @returns {D2D1_INK_NIB_SHAPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape">D2D1_INK_NIB_SHAPE</a></b>
     * 
     * Returns the pre-transform nib shape for this style.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1inkstyle-getnibshape
     */
    GetNibShape() {
        result := ComCall(7, this, D2D1_INK_NIB_SHAPE)
        return result
    }

    Query(iid) {
        if (ID2D1InkStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNibTransform := CallbackCreate(GetMethod(implObj, "SetNibTransform"), flags, 2)
        this.vtbl.GetNibTransform := CallbackCreate(GetMethod(implObj, "GetNibTransform"), flags, 2)
        this.vtbl.SetNibShape := CallbackCreate(GetMethod(implObj, "SetNibShape"), flags, 2)
        this.vtbl.GetNibShape := CallbackCreate(GetMethod(implObj, "GetNibShape"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNibTransform)
        CallbackFree(this.vtbl.GetNibTransform)
        CallbackFree(this.vtbl.SetNibShape)
        CallbackFree(this.vtbl.GetNibShape)
    }
}
