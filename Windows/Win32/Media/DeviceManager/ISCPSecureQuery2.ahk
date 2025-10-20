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
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Byte>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {Pointer<IMDSPStorageGlobals>} pStorageGlobals 
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
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    MakeDecision2(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange, abMac) {
        result := ComCall(7, this, "uint", fuFlags, "char*", pData, "uint", dwSize, "uint", dwAppSec, "char*", pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "char*", pAppCertApp, "uint", dwAppCertAppLen, "char*", pAppCertSP, "uint", dwAppCertSPLen, "ptr", pszRevocationURL, "uint*", pdwRevocationURLLen, "uint*", pdwRevocationBitFlag, "uint*", pqwFileSize, "ptr", pUnknown, "ptr", ppExchange, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
