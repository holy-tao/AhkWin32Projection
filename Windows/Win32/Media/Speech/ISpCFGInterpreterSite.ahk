#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpCFGInterpreterSite extends IUnknown {
    /**
     * The interface identifier for ISpCFGInterpreterSite
     * @type {Guid}
     */
    static IID := Guid("{6a6ffad8-78b6-473d-b844-98152e4fb16b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpCFGInterpreterSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTextReplacement : IntPtr
        AddProperty        : IntPtr
        GetResourceValue   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpCFGInterpreterSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPPHRASEREPLACEMENT>} pReplace 
     * @returns {HRESULT} 
     */
    AddTextReplacement(pReplace) {
        result := ComCall(3, this, SPPHRASEREPLACEMENT.Ptr, pReplace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPPHRASEPROPERTY>} pProperty 
     * @returns {HRESULT} 
     */
    AddProperty(pProperty) {
        result := ComCall(4, this, SPPHRASEPROPERTY.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszResourceName 
     * @returns {PWSTR} 
     */
    GetResourceValue(pszResourceName) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(5, this, "ptr", pszResourceName, PWSTR.Ptr, &ppCoMemResource := 0, "HRESULT")
        return ppCoMemResource
    }

    Query(iid) {
        if (ISpCFGInterpreterSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTextReplacement := CallbackCreate(GetMethod(implObj, "AddTextReplacement"), flags, 2)
        this.vtbl.AddProperty := CallbackCreate(GetMethod(implObj, "AddProperty"), flags, 2)
        this.vtbl.GetResourceValue := CallbackCreate(GetMethod(implObj, "GetResourceValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTextReplacement)
        CallbackFree(this.vtbl.AddProperty)
        CallbackFree(this.vtbl.GetResourceValue)
    }
}
