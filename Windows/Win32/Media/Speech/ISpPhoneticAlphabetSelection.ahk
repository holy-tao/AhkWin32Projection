#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhoneticAlphabetSelection extends IUnknown {
    /**
     * The interface identifier for ISpPhoneticAlphabetSelection
     * @type {Guid}
     */
    static IID := Guid("{b2745efd-42ce-48ca-81f1-a96e02538a90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhoneticAlphabetSelection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsAlphabetUPS    : IntPtr
        SetAlphabetToUPS : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhoneticAlphabetSelection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAlphabetUPS() {
        result := ComCall(3, this, BOOL.Ptr, &pfIsUPS := 0, "HRESULT")
        return pfIsUPS
    }

    /**
     * 
     * @param {BOOL} fForceUPS 
     * @returns {HRESULT} 
     */
    SetAlphabetToUPS(fForceUPS) {
        result := ComCall(4, this, BOOL, fForceUPS, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPhoneticAlphabetSelection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsAlphabetUPS := CallbackCreate(GetMethod(implObj, "IsAlphabetUPS"), flags, 2)
        this.vtbl.SetAlphabetToUPS := CallbackCreate(GetMethod(implObj, "SetAlphabetToUPS"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsAlphabetUPS)
        CallbackFree(this.vtbl.SetAlphabetToUPS)
    }
}
