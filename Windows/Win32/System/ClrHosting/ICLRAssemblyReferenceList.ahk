#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRAssemblyReferenceList extends IUnknown {
    /**
     * The interface identifier for ICLRAssemblyReferenceList
     * @type {Guid}
     */
    static IID := Guid("{1b2c9750-2e66-4bda-8b44-0a642c5cd733}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRAssemblyReferenceList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsStringAssemblyReferenceInList : IntPtr
        IsAssemblyReferenceInList       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRAssemblyReferenceList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzAssemblyName 
     * @returns {HRESULT} 
     */
    IsStringAssemblyReferenceInList(pwzAssemblyName) {
        pwzAssemblyName := pwzAssemblyName is String ? StrPtr(pwzAssemblyName) : pwzAssemblyName

        result := ComCall(3, this, "ptr", pwzAssemblyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pName 
     * @returns {HRESULT} 
     */
    IsAssemblyReferenceInList(pName) {
        result := ComCall(4, this, "ptr", pName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRAssemblyReferenceList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsStringAssemblyReferenceInList := CallbackCreate(GetMethod(implObj, "IsStringAssemblyReferenceInList"), flags, 2)
        this.vtbl.IsAssemblyReferenceInList := CallbackCreate(GetMethod(implObj, "IsAssemblyReferenceInList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsStringAssemblyReferenceInList)
        CallbackFree(this.vtbl.IsAssemblyReferenceInList)
    }
}
