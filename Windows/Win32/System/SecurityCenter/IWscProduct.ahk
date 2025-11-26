#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for getting product information for an individual provider to interact with Windows Security Center.
 * @see https://docs.microsoft.com/windows/win32/api//iwscapi/nn-iwscapi-iwscproduct
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWscProduct extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWscProduct
     * @type {Guid}
     */
    static IID => Guid("{8c38232e-3a45-4a27-92b0-1a16a975f669}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductName", "get_ProductState", "get_SignatureStatus", "get_RemediationPath", "get_ProductStateTimestamp", "get_ProductGuid", "get_ProductIsDefault"]

    /**
     * @type {BSTR} 
     */
    ProductName {
        get => this.get_ProductName()
    }

    /**
     * @type {Integer} 
     */
    ProductState {
        get => this.get_ProductState()
    }

    /**
     * @type {Integer} 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productname
     */
    get_ProductName() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productstate
     */
    get_ProductState() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_signaturestatus
     */
    get_SignatureStatus() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_remediationpath
     */
    get_RemediationPath() {
        pVal := BSTR()
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproduct-get_productstatetimestamp
     */
    get_ProductStateTimestamp() {
        pVal := BSTR()
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProductGuid() {
        pVal := BSTR()
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ProductIsDefault() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
