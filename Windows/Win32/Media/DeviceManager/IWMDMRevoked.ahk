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
     * 
     * @param {Pointer<PWSTR>} ppwszRevocationURL 
     * @param {Pointer<UInt32>} pdwBufferLen 
     * @param {Pointer<UInt32>} pdwRevokedBitFlag 
     * @returns {HRESULT} 
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen, pdwRevokedBitFlag) {
        result := ComCall(3, this, "ptr", ppwszRevocationURL, "uint*", pdwBufferLen, "uint*", pdwRevokedBitFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
