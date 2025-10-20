#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supports the creation of proof of possession cookies.
 * @see https://docs.microsoft.com/windows/win32/api//proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager extends IUnknown{
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager
     * @type {Guid}
     */
    static IID => Guid("{cdaece56-4edf-43df-b113-88e4556fa1bb}")

    /**
     * The class identifier for ProofOfPossessionCookieInfoManager
     * @type {Guid}
     */
    static CLSID => Guid("{a9927f85-a304-4390-8b23-a75f1c668600}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<UInt32>} cookieInfoCount 
     * @param {Pointer<ProofOfPossessionCookieInfo>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoForUri(uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(3, this, "ptr", uri, "uint*", cookieInfoCount, "ptr", cookieInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
