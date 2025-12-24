#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage2.ahk

/**
 * The IMDSPStorage3 interface extends IMDSPStorage2 by supporting metadata.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage3 extends IMDSPStorage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage3
     * @type {Guid}
     */
    static IID => Guid("{6c669867-97ed-4a67-9706-1c5529d2a414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata", "SetMetadata"]

    /**
     * The GetMetadata method retrieves metadata from the service provider.
     * @param {IWMDMMetaData} pMetadata Pointer to an <b>IWMDMMetaData</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage3-getmetadata
     */
    GetMetadata(pMetadata) {
        result := ComCall(17, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * The SetMetadata method provides the metadata associated with a specified content.
     * @param {IWMDMMetaData} pMetadata Pointer to an <b>IWMDMMetadata</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded, which indicates that SP has successfully processed the metadata.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support setting metadata.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(18, this, "ptr", pMetadata, "HRESULT")
        return result
    }
}
