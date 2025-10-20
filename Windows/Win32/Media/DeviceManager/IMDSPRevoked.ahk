#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPRevoked interface retrieves the URL from which updated components can be downloaded. Implementing this interface is optional. For more information, see Mandatory and Optional Interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdsprevoked
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPRevoked extends IUnknown{
    /**
     * The interface identifier for IMDSPRevoked
     * @type {Guid}
     */
    static IID => Guid("{a4e8f2d4-3f31-464d-b53d-4fc335998184}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszRevocationURL 
     * @param {Pointer<UInt32>} pdwBufferLen 
     * @returns {HRESULT} 
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        result := ComCall(3, this, "ptr", ppwszRevocationURL, "uint*", pdwBufferLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
