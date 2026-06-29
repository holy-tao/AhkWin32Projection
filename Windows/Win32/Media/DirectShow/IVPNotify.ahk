#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVPBaseNotify.ahk" { IVPBaseNotify }
#Import ".\AMVP_MODE.ahk" { AMVP_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Supports a private communication mechanism between the Overlay Mixer filter and a VPE decoder filter that represents a hardware decoder.Only the Overlay Mixer filter implements this interface. Applications should never use it.
 * @remarks
 * Include Vptype.h before Vpnotify.h.
 * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nn-vpnotify-ivpnotify
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPNotify extends IVPBaseNotify {
    /**
     * The interface identifier for IVPNotify
     * @type {Guid}
     */
    static IID := Guid("{c76794a1-d6c5-11d0-9e69-00c04fd7c15b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPNotify interfaces
    */
    struct Vtbl extends IVPBaseNotify.Vtbl {
        SetDeinterlaceMode : IntPtr
        GetDeinterlaceMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the mode (such as bob or weave).
     * @remarks
     * Include Vptype.h before Vpnotify.h.
     * @param {AMVP_MODE} _mode Specified mode. This value is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ne-vptype-amvp_mode">AMVP_MODE</a> enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify-setdeinterlacemode
     */
    SetDeinterlaceMode(_mode) {
        result := ComCall(4, this, AMVP_MODE, _mode, "HRESULT")
        return result
    }

    /**
     * The GetDeinterlaceMode method retrieves the mode (such as bob or weave).
     * @remarks
     * Include Vptype.h before Vpnotify.h.
     * @param {Pointer<AMVP_MODE>} pMode Pointer to the retrieved mode. This value is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ne-vptype-amvp_mode">AMVP_MODE</a> enumerated data type.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify-getdeinterlacemode
     */
    GetDeinterlaceMode(pMode) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pModeMarshal, pMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVPNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDeinterlaceMode := CallbackCreate(GetMethod(implObj, "SetDeinterlaceMode"), flags, 2)
        this.vtbl.GetDeinterlaceMode := CallbackCreate(GetMethod(implObj, "GetDeinterlaceMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDeinterlaceMode)
        CallbackFree(this.vtbl.GetDeinterlaceMode)
    }
}
