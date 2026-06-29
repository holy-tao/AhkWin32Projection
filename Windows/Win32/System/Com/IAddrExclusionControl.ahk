#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IAddrExclusionControl extends IUnknown {
    /**
     * The interface identifier for IAddrExclusionControl
     * @type {Guid}
     */
    static IID := Guid("{00000148-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAddrExclusionControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentAddrExclusionList : IntPtr
        UpdateAddrExclusionList     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAddrExclusionControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCurrentAddrExclusionList(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppEnumerator := 0, "HRESULT")
        return ppEnumerator
    }

    /**
     * 
     * @param {IUnknown} pEnumerator 
     * @returns {HRESULT} 
     */
    UpdateAddrExclusionList(pEnumerator) {
        result := ComCall(4, this, "ptr", pEnumerator, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAddrExclusionControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentAddrExclusionList := CallbackCreate(GetMethod(implObj, "GetCurrentAddrExclusionList"), flags, 3)
        this.vtbl.UpdateAddrExclusionList := CallbackCreate(GetMethod(implObj, "UpdateAddrExclusionList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentAddrExclusionList)
        CallbackFree(this.vtbl.UpdateAddrExclusionList)
    }
}
