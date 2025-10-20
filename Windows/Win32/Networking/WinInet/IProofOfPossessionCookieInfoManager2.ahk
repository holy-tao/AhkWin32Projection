#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager2 extends IUnknown{
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
     * 
     * @param {Pointer<IInspectable>} webAccount 
     * @param {PWSTR} uri 
     * @param {Pointer<UInt32>} cookieInfoCount 
     * @param {Pointer<ProofOfPossessionCookieInfo>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoWithUriForAccount(webAccount, uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(3, this, "ptr", webAccount, "ptr", uri, "uint*", cookieInfoCount, "ptr", cookieInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
