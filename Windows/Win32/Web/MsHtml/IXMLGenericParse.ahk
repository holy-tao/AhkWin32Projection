#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IXMLGenericParse extends IUnknown {
    /**
     * The interface identifier for IXMLGenericParse
     * @type {Guid}
     */
    static IID := Guid("{e4e23071-4d07-11d2-ae76-0080c73bc199}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLGenericParse interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGenericParse : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLGenericParse.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDoGeneric 
     * @returns {HRESULT} 
     */
    SetGenericParse(fDoGeneric) {
        result := ComCall(3, this, VARIANT_BOOL, fDoGeneric, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLGenericParse.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGenericParse := CallbackCreate(GetMethod(implObj, "SetGenericParse"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGenericParse)
    }
}
