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
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Byte>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {Pointer<IMDSPStorageGlobals>} pStgGlobals 
     * @param {Pointer<IWMDMProgress3>} pProgressCallback 
     * @param {Pointer<WMDMRIGHTS>} ppRights 
     * @param {Pointer<UInt32>} pnRightsCount 
     * @returns {HRESULT} 
     */
    GetRightsOnClearChannel(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, pProgressCallback, ppRights, pnRightsCount) {
        result := ComCall(8, this, "char*", pData, "uint", dwSize, "char*", pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, "ptr", pProgressCallback, "ptr", ppRights, "uint*", pnRightsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Byte>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {Pointer<IMDSPStorageGlobals>} pStorageGlobals 
     * @param {Pointer<IWMDMProgress3>} pProgressCallback 
     * @param {Pointer<Byte>} pAppCertApp 
     * @param {Integer} dwAppCertAppLen 
     * @param {Pointer<Byte>} pAppCertSP 
     * @param {Integer} dwAppCertSPLen 
     * @param {Pointer<PWSTR>} pszRevocationURL 
     * @param {Pointer<UInt32>} pdwRevocationURLLen 
     * @param {Pointer<UInt32>} pdwRevocationBitFlag 
     * @param {Pointer<UInt64>} pqwFileSize 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<ISCPSecureExchange>} ppExchange 
     * @returns {HRESULT} 
     */
    MakeDecisionOnClearChannel(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pProgressCallback, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange) {
        result := ComCall(9, this, "uint", fuFlags, "char*", pData, "uint", dwSize, "uint", dwAppSec, "char*", pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr", pProgressCallback, "char*", pAppCertApp, "uint", dwAppCertAppLen, "char*", pAppCertSP, "uint", dwAppCertSPLen, "ptr", pszRevocationURL, "uint*", pdwRevocationURLLen, "uint*", pdwRevocationBitFlag, "uint*", pqwFileSize, "ptr", pUnknown, "ptr", ppExchange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
