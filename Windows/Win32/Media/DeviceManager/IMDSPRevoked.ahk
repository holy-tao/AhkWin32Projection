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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRevocationURL"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszRevocationURL 
     * @param {Pointer<Integer>} pdwBufferLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdsprevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        result := ComCall(3, this, "ptr", ppwszRevocationURL, "uint*", pdwBufferLen, "HRESULT")
        return result
    }
}
