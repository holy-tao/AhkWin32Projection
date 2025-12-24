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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoForUri"]

    /**
     * Gets cookie information for the supplied URI to be used for proof of possession cookies.
     * @param {PWSTR} uri The URI to get cookie information for. The URI is case-sensitive.
     * @param {Pointer<Integer>} cookieInfoCount The number of cookies found for the <i>uri</i>.
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo The cookie information for the <i>uri</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager-getcookieinfoforuri
     */
    GetCookieInfoForUri(uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", uri, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }
}
