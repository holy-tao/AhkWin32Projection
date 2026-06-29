#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\ID2D1ConcreteTransform.ahk" { ID2D1ConcreteTransform }

/**
 * Extends the input rectangle to infinity using the specified extend modes.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1bordertransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BorderTransform extends ID2D1ConcreteTransform {
    /**
     * The interface identifier for ID2D1BorderTransform
     * @type {Guid}
     */
    static IID := Guid("{4998735c-3a19-473c-9781-656847e3a347}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BorderTransform interfaces
    */
    struct Vtbl extends ID2D1ConcreteTransform.Vtbl {
        SetExtendModeX : IntPtr
        SetExtendModeY : IntPtr
        GetExtendModeX : IntPtr
        GetExtendModeY : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BorderTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the extend mode in the x direction.
     * @remarks
     * If the extend mode enumeration is invalid, this operation is ignored.
     * @param {D2D1_EXTEND_MODE} extendMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the x direction.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-setextendmodex
     */
    SetExtendModeX(extendMode) {
        ComCall(6, this, D2D1_EXTEND_MODE, extendMode)
    }

    /**
     * Sets the extend mode in the y direction.
     * @remarks
     * If the extend mode enumeration is invalid, this operation is ignored.
     * @param {D2D1_EXTEND_MODE} extendMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the y direction.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-setextendmodey
     */
    SetExtendModeY(extendMode) {
        ComCall(7, this, D2D1_EXTEND_MODE, extendMode)
    }

    /**
     * Gets the extend mode in the x direction.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the extend mode in the x direction.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(8, this, D2D1_EXTEND_MODE)
        return result
    }

    /**
     * Gets the extend mode in the y direction.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the extend mode in the y direction.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(9, this, D2D1_EXTEND_MODE)
        return result
    }

    Query(iid) {
        if (ID2D1BorderTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetExtendModeX := CallbackCreate(GetMethod(implObj, "SetExtendModeX"), flags, 2)
        this.vtbl.SetExtendModeY := CallbackCreate(GetMethod(implObj, "SetExtendModeY"), flags, 2)
        this.vtbl.GetExtendModeX := CallbackCreate(GetMethod(implObj, "GetExtendModeX"), flags, 1)
        this.vtbl.GetExtendModeY := CallbackCreate(GetMethod(implObj, "GetExtendModeY"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetExtendModeX)
        CallbackFree(this.vtbl.SetExtendModeY)
        CallbackFree(this.vtbl.GetExtendModeX)
        CallbackFree(this.vtbl.GetExtendModeY)
    }
}
