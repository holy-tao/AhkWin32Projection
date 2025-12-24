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
     * The GetRevocationURL method retrieves the URL from which updated components can be downloaded.
     * @param {Pointer<PWSTR>} ppwszRevocationURL Pointer to a Unicode string where the revocation URL should be written.
     * @param {Pointer<Integer>} pdwBufferLen Number of <b>WCHAR</b> characters that the buffer supplied by the client can hold; on return it contains the required number of characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdsprevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        ppwszRevocationURLMarshal := ppwszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppwszRevocationURLMarshal, ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, "HRESULT")
        return result
    }
}
