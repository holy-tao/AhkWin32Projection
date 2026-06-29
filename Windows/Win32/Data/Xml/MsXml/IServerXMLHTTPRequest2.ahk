#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IServerXMLHTTPRequest.ahk" { IServerXMLHTTPRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SXH_PROXY_SETTING.ahk" { SXH_PROXY_SETTING }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IServerXMLHTTPRequest2 extends IServerXMLHTTPRequest {
    /**
     * The interface identifier for IServerXMLHTTPRequest2
     * @type {Guid}
     */
    static IID := Guid("{2e01311b-c322-4b0a-bd77-b90cfdc8dce7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServerXMLHTTPRequest2 interfaces
    */
    struct Vtbl extends IServerXMLHTTPRequest.Vtbl {
        setProxy            : IntPtr
        setProxyCredentials : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServerXMLHTTPRequest2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SXH_PROXY_SETTING} proxySetting 
     * @param {VARIANT} varProxyServer 
     * @param {VARIANT} varBypassList 
     * @returns {HRESULT} 
     */
    setProxy(proxySetting, varProxyServer, varBypassList) {
        result := ComCall(25, this, SXH_PROXY_SETTING, proxySetting, VARIANT, varProxyServer, VARIANT, varBypassList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    setProxyCredentials(bstrUserName, bstrPassword) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(26, this, BSTR, bstrUserName, BSTR, bstrPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServerXMLHTTPRequest2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setProxy := CallbackCreate(GetMethod(implObj, "setProxy"), flags, 4)
        this.vtbl.setProxyCredentials := CallbackCreate(GetMethod(implObj, "setProxyCredentials"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setProxy)
        CallbackFree(this.vtbl.setProxyCredentials)
    }
}
