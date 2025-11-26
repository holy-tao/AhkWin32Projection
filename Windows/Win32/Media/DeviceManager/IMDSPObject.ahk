#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPObject interface manages the transfer of data to and from storage media.The Open, Read, Write, and Close methods are valid only if the storage object is a file.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspobject
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPObject
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a18-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Read", "Write", "Delete", "Seek", "Rename", "Move", "Close"]

    /**
     * The Open method opens the associated object and prepares it for Read or Write operations. This operation is valid only if the storage object represents a file.
     * @param {Integer} fuMode Mode in which the file must be opened. It must be one of the following two values.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MDSP_READ</td>
     * <td>Query whether a subsequent call to <b>Read</b> would be allowed.</td>
     * </tr>
     * <tr>
     * <td>MDSP_WRITE</td>
     * <td>Query whether a subsequent call to <b>Insert</b> would be allowed.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-open
     */
    Open(fuMode) {
        result := ComCall(3, this, "uint", fuMode, "HRESULT")
        return result
    }

    /**
     * The Read method reads data from the object at the current position. This operation is valid only if the storage object represents a file.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> specifying the number of bytes of data to read. Upon return, this parameter contains the actual amount of data read. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {Integer} Pointer to a buffer to receive the data read from the object. This parameter is included in the output message authentication code and must be encrypted using <a href="https://docs.microsoft.com/previous-versions/ms868509(v=msdn.10)">CSecureChannelServer::EncryptParam</a>. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-read
     */
    Read(pdwSize, abMac) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return pData
    }

    /**
     * The Write method writes data to the object at the current position within the object. This operation is valid only if the storage object represents a file.
     * @param {Pointer<Integer>} pData Pointer to the buffer containing the data to write to the object. This parameter is encrypted and must be decrypted using <a href="https://docs.microsoft.com/previous-versions/bb231598(v=vs.85)">CSecureChannelServer::DecryptParam</a> with the MAC in <i>abMac</i>. See Remarks.
     * @param {Pointer<Integer>} pdwSize <b>DWORD</b> containing the number of bytes of data to write. Upon return, this parameter contains the actual number of bytes written. This parameter must be included in both the input and output message authentication codes.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-write
     */
    Write(pData, pdwSize, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The Delete method removes an object or objects from a storage medium on a media device.
     * @param {Integer} fuMode Flag that must always be set to WMDM_MODE_RECURSIVE by the client. If the object is a folder, it and its contents, and all subfolders and their contents are deleted. If the object is a file, this parameter is ignored.
     * @param {IWMDMProgress} pProgress Pointer to an application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface that enables the application to receive progress notifications for lengthy <b>Delete</b> operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-delete
     */
    Delete(fuMode, pProgress) {
        result := ComCall(6, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * The Seek method sets the current position within the object. This operation is valid only if the storage object represents a file.
     * @param {Integer} fuFlags Mode in which the file must be opened. It must be one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MDSP_SEEK_BOF</td>
     * <td>Seek <i>dwOffset</i> bytes forward from the beginning of the file.</td>
     * </tr>
     * <tr>
     * <td>MDSP_SEEK_CUR</td>
     * <td>Seek <i>dwOffset</i> bytes forward from the current position.</td>
     * </tr>
     * <tr>
     * <td>MDSP_SEEK_EOF</td>
     * <td>Seek <i>dwOffset</i> bytes backward from the end of the file.</td>
     * </tr>
     * </table>
     * @param {Integer} dwOffset <b>DWORD</b> containing the number of bytes to seek.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-seek
     */
    Seek(fuFlags, dwOffset) {
        result := ComCall(7, this, "uint", fuFlags, "uint", dwOffset, "HRESULT")
        return result
    }

    /**
     * The Rename method renames the associated object which can be a file or a folder.
     * @param {PWSTR} pwszNewName Pointer to a wide-character null-terminated string to receive a new name for the object. For information on how to use the <b>LPWSTR</b> variable type, see the Windows documentation.
     * @param {IWMDMProgress} pProgress Pointer to an application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface that enables the application to receive progress notification for lengthy renaming operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-rename
     */
    Rename(pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(8, this, "ptr", pwszNewName, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * The Move method moves a file or folder on a media device.
     * @param {Integer} fuMode Processing mode by which to invoke the <b>Move</b> operation and the method by which to move. Specify exactly one of the following two modes. If both modes are specified, block mode is used.
     * 
     * <table>
     * <tr>
     * <th>Mode
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_BLOCK</td>
     * <td>The operation will be performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation will be performed using thread mode processing. The call will return immediately, and the operation will be performed in a background thread.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following table lists flags that indicate where the object will be moved to. One value from this table is combined with one value from the preceding Mode table by using a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Method of move
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTBEFORE</td>
     * <td>The object will be inserted before the target object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTINTO</td>
     * <td>The object will be inserted into the target object. The target object must be a folder. If the target object is a file, this method fails.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTAFTER</td>
     * <td>The object will be inserted after the target object.</td>
     * </tr>
     * </table>
     * @param {IWMDMProgress} pProgress Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface that has been implemented by the application to track the progress of ongoing operations. This parameter is optional and should be set to <b>NULL</b> when not being used.
     * @param {IMDSPStorage} pTarget Pointer to the target object before or after which you want to put the current object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-move
     */
    Move(fuMode, pProgress, pTarget) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * The Close method closes a file on a storage medium of a media device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject-close
     */
    Close() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
