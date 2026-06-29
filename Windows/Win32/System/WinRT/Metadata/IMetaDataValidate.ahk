#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataValidate extends IUnknown {
    /**
     * The interface identifier for IMetaDataValidate
     * @type {Guid}
     */
    static IID := Guid("{4709c9c6-81ff-11d3-9fc7-00c04f79a0a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataValidate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ValidatorInit    : IntPtr
        ValidateMetaData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataValidate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwModuleType 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    ValidatorInit(dwModuleType, pUnk) {
        result := ComCall(3, this, "uint", dwModuleType, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ValidateMetaData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataValidate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ValidatorInit := CallbackCreate(GetMethod(implObj, "ValidatorInit"), flags, 3)
        this.vtbl.ValidateMetaData := CallbackCreate(GetMethod(implObj, "ValidateMetaData"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ValidatorInit)
        CallbackFree(this.vtbl.ValidateMetaData)
    }
}
