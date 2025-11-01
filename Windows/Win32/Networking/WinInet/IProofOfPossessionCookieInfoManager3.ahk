#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager3
     * @type {Guid}
     */
    static IID => Guid("{c8891744-32bd-4a77-b92c-0e79a2823b96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoForUriWithOptions"]

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Integer} options 
     * @param {Pointer<Integer>} cookieInfoCount 
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoForUriWithOptions(uri, options, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", uri, "uint", options, cookieInfoCountMarshal, cookieInfoCount, "ptr*", cookieInfo, "HRESULT")
        return result
    }
}
