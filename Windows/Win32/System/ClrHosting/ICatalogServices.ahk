#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICatalogServices extends IUnknown {
    /**
     * The interface identifier for ICatalogServices
     * @type {Guid}
     */
    static IID := Guid("{04c6be1e-1db1-4058-ab7a-700cccfbf254}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatalogServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Autodone    : IntPtr
        NotAutodone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatalogServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Autodone() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotAutodone() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICatalogServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Autodone := CallbackCreate(GetMethod(implObj, "Autodone"), flags, 1)
        this.vtbl.NotAutodone := CallbackCreate(GetMethod(implObj, "NotAutodone"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Autodone)
        CallbackFree(this.vtbl.NotAutodone)
    }
}
