#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureQuery2.ahk

/**
 * The ISCPSecureQuery3 interface extends ISCPSecureQuery2 by providing a set of new methods for retrieving the rights and making decision on a clear channel.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecurequery3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureQuery3 extends ISCPSecureQuery2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureQuery3
     * @type {Guid}
     */
    static IID => Guid("{b7edd1a2-4dab-484b-b3c5-ad39b8b4c0b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRightsOnClearChannel", "MakeDecisionOnClearChannel"]

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {IMDSPStorageGlobals} pStgGlobals 
     * @param {IWMDMProgress3} pProgressCallback 
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights 
     * @param {Pointer<Integer>} pnRightsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery3-getrightsonclearchannel
     */
    GetRightsOnClearChannel(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, pProgressCallback, ppRights, pnRightsCount) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pDataMarshal, pData, "uint", dwSize, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, "ptr", pProgressCallback, "ptr*", ppRights, pnRightsCountMarshal, pnRightsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Integer>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {IMDSPStorageGlobals} pStorageGlobals 
     * @param {IWMDMProgress3} pProgressCallback 
     * @param {Pointer<Integer>} pAppCertApp 
     * @param {Integer} dwAppCertAppLen 
     * @param {Pointer<Integer>} pAppCertSP 
     * @param {Integer} dwAppCertSPLen 
     * @param {Pointer<PWSTR>} pszRevocationURL 
     * @param {Pointer<Integer>} pdwRevocationURLLen 
     * @param {Pointer<Integer>} pdwRevocationBitFlag 
     * @param {Pointer<Integer>} pqwFileSize 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<ISCPSecureExchange>} ppExchange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery3-makedecisiononclearchannel
     */
    MakeDecisionOnClearChannel(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pProgressCallback, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pAppCertAppMarshal := pAppCertApp is VarRef ? "char*" : "ptr"
        pAppCertSPMarshal := pAppCertSP is VarRef ? "char*" : "ptr"
        pdwRevocationURLLenMarshal := pdwRevocationURLLen is VarRef ? "uint*" : "ptr"
        pdwRevocationBitFlagMarshal := pdwRevocationBitFlag is VarRef ? "uint*" : "ptr"
        pqwFileSizeMarshal := pqwFileSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr", pProgressCallback, pAppCertAppMarshal, pAppCertApp, "uint", dwAppCertAppLen, pAppCertSPMarshal, pAppCertSP, "uint", dwAppCertSPLen, "ptr", pszRevocationURL, pdwRevocationURLLenMarshal, pdwRevocationURLLen, pdwRevocationBitFlagMarshal, pdwRevocationBitFlag, pqwFileSizeMarshal, pqwFileSize, "ptr", pUnknown, "ptr*", ppExchange, "HRESULT")
        return result
    }
}
