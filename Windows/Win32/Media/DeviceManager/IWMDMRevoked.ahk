#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMRevoked interface retrieves the URL from which updated components can be downloaded, if a transfer fails with a revocation error.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdmrevoked
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
     * The GetRevocationURL method retrieves the URL from which updated components can be downloaded. (IWMDMRevoked.GetRevocationURL)
     * @remarks
     * This method retrieves the URL from which updated components can be downloaded. If this method is not implemented by the revoked component, a default Microsoft URL is used. This location is maintained by Microsoft and contains any updates to components revoked by the Microsoft digital rights management system.
     * @param {Pointer<PWSTR>} ppwszRevocationURL Pointer to a string containing a revocation URL. This buffer is created and freed by the caller.
     * @param {Pointer<Integer>} pdwBufferLen Size of the buffer holding the revocation URL.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmrevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        ppwszRevocationURLMarshal := ppwszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppwszRevocationURLMarshal, ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, "uint*", &pdwRevokedBitFlag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRevokedBitFlag
    }
}
