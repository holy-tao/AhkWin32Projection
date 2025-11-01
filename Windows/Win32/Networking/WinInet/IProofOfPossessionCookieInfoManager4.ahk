#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager4
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager4 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoForUriWithUserAgentId", "GetCookieInfoWithUriAndUserAgentIdForAccount"]

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} uaClientId 
     * @param {Pointer<Integer>} cookieInfoCount 
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-getcookieinfoforuriwithuseragentid
     */
    GetCookieInfoForUriWithUserAgentId(uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", uri, "ptr", uaClientId, cookieInfoCountMarshal, cookieInfoCount, "ptr*", cookieInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInspectable} webAccount 
     * @param {PWSTR} uri 
     * @param {PWSTR} uaClientId 
     * @param {Pointer<Integer>} cookieInfoCount 
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-getcookieinfowithurianduseragentidforaccount
     */
    GetCookieInfoWithUriAndUserAgentIdForAccount(webAccount, uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", webAccount, "ptr", uri, "ptr", uaClientId, cookieInfoCountMarshal, cookieInfoCount, "ptr*", cookieInfo, "HRESULT")
        return result
    }
}
