#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * If a BDA device filter, specifically a demodulator, exposes this interface, it indicates that the filter can automatically detect signal characteristics.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_AutoDemodulate)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_autodemodulate
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_AutoDemodulate extends IUnknown {
    /**
     * The interface identifier for IBDA_AutoDemodulate
     * @type {Guid}
     */
    static IID := Guid("{ddf15b12-bd25-11d2-9ca0-00c04f7971e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_AutoDemodulate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_AutoDemodulate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_AutoDemodulate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The put_AutoDemodulate method instructs the BDA device filter to automatically detect signal characteristics.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulate-put_autodemodulate
     */
    put_AutoDemodulate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_AutoDemodulate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_AutoDemodulate := CallbackCreate(GetMethod(implObj, "put_AutoDemodulate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_AutoDemodulate)
    }
}
