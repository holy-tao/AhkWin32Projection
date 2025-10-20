#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager4 extends IUnknown{
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager4
     * @type {Guid}
     */
    static IID => Guid("{3b74c75b-6e3f-494e-95ec-13174e12a89f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} uaClientId 
     * @param {Pointer<UInt32>} cookieInfoCount 
     * @param {Pointer<ProofOfPossessionCookieInfo>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoForUriWithUserAgentId(uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        result := ComCall(3, this, "ptr", uri, "ptr", uaClientId, "uint*", cookieInfoCount, "ptr", cookieInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} webAccount 
     * @param {PWSTR} uri 
     * @param {PWSTR} uaClientId 
     * @param {Pointer<UInt32>} cookieInfoCount 
     * @param {Pointer<ProofOfPossessionCookieInfo>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoWithUriAndUserAgentIdForAccount(webAccount, uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        result := ComCall(4, this, "ptr", webAccount, "ptr", uri, "ptr", uaClientId, "uint*", cookieInfoCount, "ptr", cookieInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
