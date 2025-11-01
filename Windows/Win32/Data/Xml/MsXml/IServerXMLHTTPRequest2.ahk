#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IServerXMLHTTPRequest.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IServerXMLHTTPRequest2 extends IServerXMLHTTPRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerXMLHTTPRequest2
     * @type {Guid}
     */
    static IID => Guid("{2e01311b-c322-4b0a-bd77-b90cfdc8dce7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setProxy", "setProxyCredentials"]

    /**
     * 
     * @param {Integer} proxySetting 
     * @param {VARIANT} varProxyServer 
     * @param {VARIANT} varBypassList 
     * @returns {HRESULT} 
     */
    setProxy(proxySetting, varProxyServer, varBypassList) {
        result := ComCall(25, this, "int", proxySetting, "ptr", varProxyServer, "ptr", varBypassList, "HRESULT")
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

        result := ComCall(26, this, "ptr", bstrUserName, "ptr", bstrPassword, "HRESULT")
        return result
    }
}
