#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IUpdateException.ahk" { IUpdateException }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Encapsulates the exception that is thrown when an invalid license is detected for a product.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinvalidproductlicenseexception
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInvalidProductLicenseException extends IUpdateException {
    /**
     * The interface identifier for IInvalidProductLicenseException
     * @type {Guid}
     */
    static IID := Guid("{a37d00f5-7bb0-4953-b414-f9e98326f2e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInvalidProductLicenseException interfaces
    */
    struct Vtbl extends IUpdateException.Vtbl {
        get_Product : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInvalidProductLicenseException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * Gets the language-invariant name of the product.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinvalidproductlicenseexception-get_product
     */
    get_Product() {
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IInvalidProductLicenseException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Product := CallbackCreate(GetMethod(implObj, "get_Product"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Product)
    }
}
