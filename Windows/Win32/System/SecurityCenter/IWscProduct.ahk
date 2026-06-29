#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WSC_SECURITY_SIGNATURE_STATUS.ahk" { WSC_SECURITY_SIGNATURE_STATUS }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WSC_SECURITY_PRODUCT_STATE.ahk" { WSC_SECURITY_PRODUCT_STATE }

/**
 * Provides methods for getting product information for an individual provider to interact with Windows Security Center.
 * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nn-iwscapi-iwscproduct
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct IWscProduct extends IDispatch {
    /**
     * The interface identifier for IWscProduct
     * @type {Guid}
     */
    static IID := Guid("{8c38232e-3a45-4a27-92b0-1a16a975f669}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWscProduct interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ProductName           : IntPtr
        get_ProductState          : IntPtr
        get_SignatureStatus       : IntPtr
        get_RemediationPath       : IntPtr
        get_ProductStateTimestamp : IntPtr
        get_ProductGuid           : IntPtr
        get_ProductIsDefault      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWscProduct.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ProductName {
        get => this.get_ProductName()
    }

    /**
     * @type {WSC_SECURITY_PRODUCT_STATE} 
     */
    ProductState {
        get => this.get_ProductState()
    }

    /**
     * @type {WSC_SECURITY_SIGNATURE_STATUS} 
     */
    SignatureStatus {
        get => this.get_SignatureStatus()
    }

    /**
     * @type {BSTR} 
     */
    RemediationPath {
        get => this.get_RemediationPath()
    }

    /**
     * @type {BSTR} 
     */
    ProductStateTimestamp {
        get => this.get_ProductStateTimestamp()
    }

    /**
     * @type {BSTR} 
     */
    ProductGuid {
        get => this.get_ProductGuid()
    }

    /**
     * @type {BOOL} 
     */
    ProductIsDefault {
        get => this.get_ProductIsDefault()
    }

    /**
     * Returns the current product information for the security product.
     * @returns {BSTR} A pointer to the name of the security product. This is displayed in the Windows Security Center user interface.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productname
     */
    get_ProductName() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns the current state of the signature data for the security product.
     * @returns {WSC_SECURITY_PRODUCT_STATE} A pointer to the state value of the signature of the security product.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productstate
     */
    get_ProductState() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns the current status of the signature data for the security product.
     * @returns {WSC_SECURITY_SIGNATURE_STATUS} A pointer to the status value of the signature of the security product. If the security product is a Firewall product, the return value is always <b>WSC_SECURITY_PRODUCT_UP_TO_DATE</b> because firewalls do not contain signature data.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_signaturestatus
     */
    get_SignatureStatus() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns the current remediation path for the security product.
     * @returns {BSTR} A pointer to the remediation path for the security product. This is displayed in the Windows Security Center user interface.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_remediationpath
     */
    get_RemediationPath() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns the current time stamp for the security product.
     * @returns {BSTR} A pointer to the time stamp of the security product. This is displayed in the Windows Security Center user interface.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productstatetimestamp
     */
    get_ProductStateTimestamp() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProductGuid() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ProductIsDefault() {
        result := ComCall(13, this, BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IWscProduct.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductName := CallbackCreate(GetMethod(implObj, "get_ProductName"), flags, 2)
        this.vtbl.get_ProductState := CallbackCreate(GetMethod(implObj, "get_ProductState"), flags, 2)
        this.vtbl.get_SignatureStatus := CallbackCreate(GetMethod(implObj, "get_SignatureStatus"), flags, 2)
        this.vtbl.get_RemediationPath := CallbackCreate(GetMethod(implObj, "get_RemediationPath"), flags, 2)
        this.vtbl.get_ProductStateTimestamp := CallbackCreate(GetMethod(implObj, "get_ProductStateTimestamp"), flags, 2)
        this.vtbl.get_ProductGuid := CallbackCreate(GetMethod(implObj, "get_ProductGuid"), flags, 2)
        this.vtbl.get_ProductIsDefault := CallbackCreate(GetMethod(implObj, "get_ProductIsDefault"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductName)
        CallbackFree(this.vtbl.get_ProductState)
        CallbackFree(this.vtbl.get_SignatureStatus)
        CallbackFree(this.vtbl.get_RemediationPath)
        CallbackFree(this.vtbl.get_ProductStateTimestamp)
        CallbackFree(this.vtbl.get_ProductGuid)
        CallbackFree(this.vtbl.get_ProductIsDefault)
    }
}
