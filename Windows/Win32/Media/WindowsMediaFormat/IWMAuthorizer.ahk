#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to certificates.
 * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nn-wmsecure-iwmauthorizer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMAuthorizer extends IUnknown {
    /**
     * The interface identifier for IWMAuthorizer
     * @type {Guid}
     */
    static IID := Guid("{d9b67d36-a9ad-4eb4-baef-db284ef5504c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMAuthorizer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCertCount  : IntPtr
        GetCert       : IntPtr
        GetSharedData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMAuthorizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the number of certificates.
     * @returns {Integer} Receives a pointer to a count of certs.
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getcertcount
     */
    GetCertCount() {
        result := ComCall(3, this, "uint*", &pcCerts := 0, "HRESULT")
        return pcCerts
    }

    /**
     * Retrieves the specified certificate.
     * @param {Integer} dwIndex The index of the certification to retrieve.
     * @returns {Pointer<Integer>} An address of a pointer to certification data. <i>ppbCertData</i> is allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and must be released by the user.
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getcert
     */
    GetCert(dwIndex) {
        result := ComCall(4, this, "uint", dwIndex, "ptr*", &ppbCertData := 0, "HRESULT")
        return ppbCertData
    }

    /**
     * Retrieves shared data for the specified certificate.
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Integer>} pbSharedData 
     * @param {Pointer<Integer>} pbCert 
     * @returns {Pointer<Integer>} An address of a pointer to certification data. <i>ppbCertData</i> is allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and must be released by the user.
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getshareddata
     */
    GetSharedData(dwCertIndex, pbSharedData, pbCert) {
        pbSharedDataMarshal := pbSharedData is VarRef ? "char*" : "ptr"
        pbCertMarshal := pbCert is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", dwCertIndex, pbSharedDataMarshal, pbSharedData, pbCertMarshal, pbCert, "ptr*", &ppbSharedData := 0, "HRESULT")
        return ppbSharedData
    }

    Query(iid) {
        if (IWMAuthorizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCertCount := CallbackCreate(GetMethod(implObj, "GetCertCount"), flags, 2)
        this.vtbl.GetCert := CallbackCreate(GetMethod(implObj, "GetCert"), flags, 3)
        this.vtbl.GetSharedData := CallbackCreate(GetMethod(implObj, "GetSharedData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCertCount)
        CallbackFree(this.vtbl.GetCert)
        CallbackFree(this.vtbl.GetSharedData)
    }
}
