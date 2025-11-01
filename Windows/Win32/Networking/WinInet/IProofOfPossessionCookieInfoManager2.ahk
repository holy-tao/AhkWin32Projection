#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager2
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager2
     * @type {Guid}
     */
    static IID => Guid("{15e41407-b42f-4ae7-9966-34a087b2d713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoWithUriForAccount"]

    /**
     * 
     * @param {IInspectable} webAccount 
     * @param {PWSTR} uri 
     * @param {Pointer<Integer>} cookieInfoCount 
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager2-getcookieinfowithuriforaccount
     */
    GetCookieInfoWithUriForAccount(webAccount, uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", webAccount, "ptr", uri, cookieInfoCountMarshal, cookieInfoCount, "ptr*", cookieInfo, "HRESULT")
        return result
    }
}
