#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable the view to notify the implementer when the enumeration has completed.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ienumreadycallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumReadyCallback extends IUnknown {
    /**
     * The interface identifier for IEnumReadyCallback
     * @type {Guid}
     */
    static IID := Guid("{61e00d45-8fff-4e60-924e-6537b61612dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumReadyCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumReady : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumReadyCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the implementer that the view's item enumeration has completed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ienumreadycallback-enumready
     */
    EnumReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumReadyCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumReady := CallbackCreate(GetMethod(implObj, "EnumReady"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumReady)
    }
}
