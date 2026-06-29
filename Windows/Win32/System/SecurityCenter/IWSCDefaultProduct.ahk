#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SECURITY_PRODUCT_TYPE.ahk" { SECURITY_PRODUCT_TYPE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct IWSCDefaultProduct extends IDispatch {
    /**
     * The interface identifier for IWSCDefaultProduct
     * @type {Guid}
     */
    static IID := Guid("{0476d69c-f21a-11e5-9ce9-5e5517507c66}")

    /**
     * The class identifier for WSCDefaultProduct
     * @type {Guid}
     */
    static CLSID := Guid("{2981a36e-f22d-11e5-9ce9-5e5517507c66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSCDefaultProduct interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetDefaultProduct : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSCDefaultProduct.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SECURITY_PRODUCT_TYPE} eType 
     * @param {BSTR} pGuid 
     * @returns {HRESULT} 
     */
    SetDefaultProduct(eType, pGuid) {
        pGuid := pGuid is String ? BSTR.Alloc(pGuid).Value : pGuid

        result := ComCall(7, this, SECURITY_PRODUCT_TYPE, eType, BSTR, pGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSCDefaultProduct.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDefaultProduct := CallbackCreate(GetMethod(implObj, "SetDefaultProduct"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDefaultProduct)
    }
}
