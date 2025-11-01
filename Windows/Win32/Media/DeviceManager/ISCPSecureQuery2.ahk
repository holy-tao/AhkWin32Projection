#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureQuery.ahk

/**
 * The ISCPSecureQuery2 interface extends ISCPSecureQuery through functionality that determines whether the secure content provider is responsible for the content, and if so, providing a URL for updating revoked components and determining which components have been revoked.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecurequery2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureQuery2 extends ISCPSecureQuery{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureQuery2
     * @type {Guid}
     */
    static IID => Guid("{ebe17e25-4fd7-4632-af46-6d93d4fcc72e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeDecision2"]

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Integer>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {IMDSPStorageGlobals} pStorageGlobals 
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
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery2-makedecision2
     */
    MakeDecision2(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pAppCertAppMarshal := pAppCertApp is VarRef ? "char*" : "ptr"
        pAppCertSPMarshal := pAppCertSP is VarRef ? "char*" : "ptr"
        pdwRevocationURLLenMarshal := pdwRevocationURLLen is VarRef ? "uint*" : "ptr"
        pdwRevocationBitFlagMarshal := pdwRevocationBitFlag is VarRef ? "uint*" : "ptr"
        pqwFileSizeMarshal := pqwFileSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, pAppCertAppMarshal, pAppCertApp, "uint", dwAppCertAppLen, pAppCertSPMarshal, pAppCertSP, "uint", dwAppCertSPLen, "ptr", pszRevocationURL, pdwRevocationURLLenMarshal, pdwRevocationURLLen, pdwRevocationBitFlagMarshal, pdwRevocationBitFlag, pqwFileSizeMarshal, pqwFileSize, "ptr", pUnknown, "ptr*", ppExchange, abMacMarshal, abMac, "HRESULT")
        return result
    }
}
