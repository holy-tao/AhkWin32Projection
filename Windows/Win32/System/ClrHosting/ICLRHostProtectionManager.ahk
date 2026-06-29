#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\EApiCategories.ahk" { EApiCategories }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRHostProtectionManager extends IUnknown {
    /**
     * The interface identifier for ICLRHostProtectionManager
     * @type {Guid}
     */
    static IID := Guid("{89f25f5c-ceef-43e1-9cfa-a68ce863aaac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRHostProtectionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProtectedCategories     : IntPtr
        SetEagerSerializeGrantSets : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRHostProtectionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EApiCategories} categories 
     * @returns {HRESULT} 
     */
    SetProtectedCategories(categories) {
        result := ComCall(3, this, EApiCategories, categories, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetEagerSerializeGrantSets() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRHostProtectionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProtectedCategories := CallbackCreate(GetMethod(implObj, "SetProtectedCategories"), flags, 2)
        this.vtbl.SetEagerSerializeGrantSets := CallbackCreate(GetMethod(implObj, "SetEagerSerializeGrantSets"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProtectedCategories)
        CallbackFree(this.vtbl.SetEagerSerializeGrantSets)
    }
}
