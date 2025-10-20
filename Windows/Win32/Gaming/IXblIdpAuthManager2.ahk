#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthManager2 extends IUnknown{
    /**
     * The interface identifier for IXblIdpAuthManager2
     * @type {Guid}
     */
    static IID => Guid("{bf8c0950-8389-43dd-9a76-a19728ec5dc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} appSid 
     * @param {PWSTR} msaTarget 
     * @param {PWSTR} msaPolicy 
     * @param {PWSTR} httpMethod 
     * @param {PWSTR} uri 
     * @param {PWSTR} headers 
     * @param {Pointer<Byte>} body 
     * @param {Integer} bodySize 
     * @param {BOOL} forceRefresh 
     * @param {Pointer<IXblIdpAuthTokenResult>} result 
     * @returns {HRESULT} 
     */
    GetUserlessTokenAndSignatureWithTokenResult(appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh, result) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaTarget := msaTarget is String ? StrPtr(msaTarget) : msaTarget
        msaPolicy := msaPolicy is String ? StrPtr(msaPolicy) : msaPolicy
        httpMethod := httpMethod is String ? StrPtr(httpMethod) : httpMethod
        uri := uri is String ? StrPtr(uri) : uri
        headers := headers is String ? StrPtr(headers) : headers

        result := ComCall(3, this, "ptr", appSid, "ptr", msaTarget, "ptr", msaPolicy, "ptr", httpMethod, "ptr", uri, "ptr", headers, "char*", body, "uint", bodySize, "int", forceRefresh, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
