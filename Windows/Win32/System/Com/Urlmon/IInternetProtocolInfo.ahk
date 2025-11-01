#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9ec-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseUrl", "CombineUrl", "CompareUrl", "QueryInfo"]

    /**
     * 
     * @param {PWSTR} pwzUrl 
     * @param {Integer} ParseAction 
     * @param {Integer} dwParseFlags 
     * @param {PWSTR} pwzResult 
     * @param {Integer} cchResult 
     * @param {Pointer<Integer>} pcchResult 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ParseUrl(pwzUrl, ParseAction, dwParseFlags, pwzResult, cchResult, pcchResult, dwReserved) {
        pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl
        pwzResult := pwzResult is String ? StrPtr(pwzResult) : pwzResult

        result := ComCall(3, this, "ptr", pwzUrl, "int", ParseAction, "uint", dwParseFlags, "ptr", pwzResult, "uint", cchResult, "uint*", pcchResult, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBaseUrl 
     * @param {PWSTR} pwzRelativeUrl 
     * @param {Integer} dwCombineFlags 
     * @param {PWSTR} pwzResult 
     * @param {Integer} cchResult 
     * @param {Pointer<Integer>} pcchResult 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    CombineUrl(pwzBaseUrl, pwzRelativeUrl, dwCombineFlags, pwzResult, cchResult, pcchResult, dwReserved) {
        pwzBaseUrl := pwzBaseUrl is String ? StrPtr(pwzBaseUrl) : pwzBaseUrl
        pwzRelativeUrl := pwzRelativeUrl is String ? StrPtr(pwzRelativeUrl) : pwzRelativeUrl
        pwzResult := pwzResult is String ? StrPtr(pwzResult) : pwzResult

        result := ComCall(4, this, "ptr", pwzBaseUrl, "ptr", pwzRelativeUrl, "uint", dwCombineFlags, "ptr", pwzResult, "uint", cchResult, "uint*", pcchResult, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUrl1 
     * @param {PWSTR} pwzUrl2 
     * @param {Integer} dwCompareFlags 
     * @returns {HRESULT} 
     */
    CompareUrl(pwzUrl1, pwzUrl2, dwCompareFlags) {
        pwzUrl1 := pwzUrl1 is String ? StrPtr(pwzUrl1) : pwzUrl1
        pwzUrl2 := pwzUrl2 is String ? StrPtr(pwzUrl2) : pwzUrl2

        result := ComCall(5, this, "ptr", pwzUrl1, "ptr", pwzUrl2, "uint", dwCompareFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUrl 
     * @param {Integer} OueryOption 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryInfo(pwzUrl, OueryOption, dwQueryFlags, pBuffer, cbBuffer, pcbBuf, dwReserved) {
        pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl

        result := ComCall(6, this, "ptr", pwzUrl, "int", OueryOption, "uint", dwQueryFlags, "ptr", pBuffer, "uint", cbBuffer, "uint*", pcbBuf, "uint", dwReserved, "HRESULT")
        return result
    }
}
