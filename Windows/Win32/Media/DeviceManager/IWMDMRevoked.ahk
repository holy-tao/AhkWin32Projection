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
     * The GetRevocationURL method retrieves the URL from which updated components can be downloaded.
     * @param {Pointer<PWSTR>} ppwszRevocationURL Pointer to a string containing a revocation URL. This buffer is created and freed by the caller.
     * @param {Pointer<Integer>} pdwBufferLen Size of the buffer holding the revocation URL.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmrevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        ppwszRevocationURLMarshal := ppwszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppwszRevocationURLMarshal, ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, "uint*", &pdwRevokedBitFlag := 0, "HRESULT")
        return pdwRevokedBitFlag
    }
}
