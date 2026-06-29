#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1TransformNode.ahk" { ID2D1TransformNode }
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Instructs the effect-rendering system to offset an input bitmap without inserting a rendering pass.
 * @remarks
 * Because a rendering pass is not required, the interface derives from a transform node. This allows it to be inserted into a graph but does not allow an output buffer to be specified.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1offsettransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1OffsetTransform extends ID2D1TransformNode {
    /**
     * The interface identifier for ID2D1OffsetTransform
     * @type {Guid}
     */
    static IID := Guid("{3fe6adea-7643-4f53-bd14-a0ce63f24042}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1OffsetTransform interfaces
    */
    struct Vtbl extends ID2D1TransformNode.Vtbl {
        SetOffset : IntPtr
        GetOffset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1OffsetTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the offset in the current offset transform.
     * @param {POINT} offset Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847948(v=vs.85)">D2D1_POINT_2L</a></b>
     * 
     * The new offset to apply to the offset transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1offsettransform-setoffset
     */
    SetOffset(offset) {
        ComCall(4, this, POINT, offset)
    }

    /**
     * Gets the offset currently in the offset transform.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847948(v=vs.85)">D2D1_POINT_2L</a></b>
     * 
     * The current transform offset.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1offsettransform-getoffset
     */
    GetOffset() {
        result := ComCall(5, this, POINT)
        return result
    }

    Query(iid) {
        if (ID2D1OffsetTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOffset := CallbackCreate(GetMethod(implObj, "SetOffset"), flags, 2)
        this.vtbl.GetOffset := CallbackCreate(GetMethod(implObj, "GetOffset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOffset)
        CallbackFree(this.vtbl.GetOffset)
    }
}
