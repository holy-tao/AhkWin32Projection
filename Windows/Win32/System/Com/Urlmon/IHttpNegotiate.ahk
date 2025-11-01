#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IHttpNegotiate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpNegotiate
     * @type {Guid}
     */
    static IID => Guid("{79eac9d2-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginningTransaction", "OnResponse"]

    /**
     * 
     * @param {PWSTR} szURL 
     * @param {PWSTR} szHeaders 
     * @param {Integer} dwReserved 
     * @param {Pointer<PWSTR>} pszAdditionalHeaders 
     * @returns {HRESULT} 
     */
    BeginningTransaction(szURL, szHeaders, dwReserved, pszAdditionalHeaders) {
        szURL := szURL is String ? StrPtr(szURL) : szURL
        szHeaders := szHeaders is String ? StrPtr(szHeaders) : szHeaders

        result := ComCall(3, this, "ptr", szURL, "ptr", szHeaders, "uint", dwReserved, "ptr", pszAdditionalHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwResponseCode 
     * @param {PWSTR} szResponseHeaders 
     * @param {PWSTR} szRequestHeaders 
     * @param {Pointer<PWSTR>} pszAdditionalRequestHeaders 
     * @returns {HRESULT} 
     */
    OnResponse(dwResponseCode, szResponseHeaders, szRequestHeaders, pszAdditionalRequestHeaders) {
        szResponseHeaders := szResponseHeaders is String ? StrPtr(szResponseHeaders) : szResponseHeaders
        szRequestHeaders := szRequestHeaders is String ? StrPtr(szRequestHeaders) : szRequestHeaders

        result := ComCall(4, this, "uint", dwResponseCode, "ptr", szResponseHeaders, "ptr", szRequestHeaders, "ptr", pszAdditionalRequestHeaders, "HRESULT")
        return result
    }
}
