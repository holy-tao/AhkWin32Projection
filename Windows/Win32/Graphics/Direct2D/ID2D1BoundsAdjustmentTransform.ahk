#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1TransformNode.ahk" { ID2D1TransformNode }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * A support transform for effects to modify the output rectangle of the previous effect or bitmap.
 * @remarks
 * The support transform can be used for two different reasons.
 * 
 * <ul>
 * <li>
 * To indicate that a region of its input image is already transparent black.  The expanded area will be treated as transparent black.
 * 
 * This can increase efficiency for rendering bitmaps.
 * 
 * </li>
 * <li>
 * To increase the size of the input image.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1boundsadjustmenttransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BoundsAdjustmentTransform extends ID2D1TransformNode {
    /**
     * The interface identifier for ID2D1BoundsAdjustmentTransform
     * @type {Guid}
     */
    static IID := Guid("{90f732e2-5092-4606-a819-8651970baccd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BoundsAdjustmentTransform interfaces
    */
    struct Vtbl extends ID2D1TransformNode.Vtbl {
        SetOutputBounds : IntPtr
        GetOutputBounds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BoundsAdjustmentTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This sets the output bounds for the support transform.
     * @param {Pointer<RECT>} outputBounds Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output bounds.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1boundsadjustmenttransform-setoutputbounds
     */
    SetOutputBounds(outputBounds) {
        ComCall(4, this, RECT.Ptr, outputBounds)
    }

    /**
     * Returns the output rectangle of the support transform.
     * @param {Pointer<RECT>} outputBounds Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output bounds.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1boundsadjustmenttransform-getoutputbounds
     */
    GetOutputBounds(outputBounds) {
        ComCall(5, this, RECT.Ptr, outputBounds)
    }

    Query(iid) {
        if (ID2D1BoundsAdjustmentTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputBounds := CallbackCreate(GetMethod(implObj, "SetOutputBounds"), flags, 2)
        this.vtbl.GetOutputBounds := CallbackCreate(GetMethod(implObj, "GetOutputBounds"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputBounds)
        CallbackFree(this.vtbl.GetOutputBounds)
    }
}
