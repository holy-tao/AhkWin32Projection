#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMRevoked interface retrieves the URL from which updated components can be downloaded, if a transfer fails with a revocation error.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmrevoked
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMRevoked extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMRevoked
     * @type {Guid}
     */
    static IID => Guid("{ebeccedb-88ee-4e55-b6a4-8d9f07d696aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRevocationURL"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszRevocationURL 
     * @param {Pointer<Integer>} pdwBufferLen 
     * @param {Pointer<Integer>} pdwRevokedBitFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmrevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen, pdwRevokedBitFlag) {
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"
        pdwRevokedBitFlagMarshal := pdwRevokedBitFlag is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, pdwRevokedBitFlagMarshal, pdwRevokedBitFlag, "HRESULT")
        return result
    }
}
