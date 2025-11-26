#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageControl interface is used to insert, delete, or move files within a storage, a device, or between a device and the computer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageControl
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a08-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Insert", "Delete", "Rename", "Read", "Move"]

    /**
     * The Insert method puts content into the storage on the device.
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFile Pointer to a wide-character <b>null</b>-terminated string indicating where to find the content for the insert operation. This parameter must be <b>NULL</b> if WMDM_CONTENT_OPERATIONINTERFACE is specified in <i>fuMode</i>.
     * @param {IWMDMOperation} pOperation Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmoperation">IWMDMOperation</a> interface, to control the transfer of content to a media device. If specified, <i>fuMode</i> must include the WMDM_CONTENT_OPERATIONINTERFACE flag. This parameter must be <b>NULL</b> if WMDM_CONTENT_FILE or WMDM_CONTENT_FOLDER is specified in <i>fuMode</i>.
     * @param {IWMDMProgress} pProgress Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface to be used by Windows Media Device Manager to report progress back to the application. If this is used, <i>fuMode</i> should include WMDM_MODE_PROGRESS.
     * @returns {IWMDMStorage} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface that will contain the new content. The caller must release this interface when finished with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol-insert
     */
    Insert(fuMode, pwszFile, pOperation, pProgress) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(3, this, "uint", fuMode, "ptr", pwszFile, "ptr", pOperation, "ptr", pProgress, "ptr*", &ppNewObject := 0, "HRESULT")
        return IWMDMStorage(ppNewObject)
    }

    /**
     * The Delete method permanently deletes this storage.
     * @param {Integer} fuMode One or two of the following flags, combined with a bitwise <b>OR</b>. Specify exactly one of the first two modes; the third mode is optional.
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
     * <td>The operation is performed using block mode (synchronous) processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode (asynchronous) processing. The call will return immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_RECURSIVE</td>
     * <td>If the storage object is a folder, it and its contents, and all subfolders and their contents are deleted.</td>
     * </tr>
     * </table>
     *  
     * 
     * 4
     * @param {IWMDMProgress} pProgress Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface to be used by Windows Media Device Manager to report progress back to the application.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol-delete
     */
    Delete(fuMode, pProgress) {
        result := ComCall(4, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * The Rename method renames the current storage.
     * @param {Integer} fuMode Processing mode used for the <b>Rename</b> operation. Specify exactly one of the following two modes. If both modes are specified, block mode is used.
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
     * <td>The operation is performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call will return immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszNewName Pointer to a wide-character null-terminated string specifying the new name.
     * @param {IWMDMProgress} pProgress Optional pointer to an <b>IWMDMProgress</b> interface that has been implemented by the application to track the progress of the action.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol-rename
     */
    Rename(fuMode, pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(5, this, "uint", fuMode, "ptr", pwszNewName, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * The Read method copies the current storage to the computer.
     * @param {Integer} fuMode Processing mode used for the <b>Read</b> operation. The following table lists the processing modes that can be specified in the <i>fuMode</i> parameter. You must specify exactly one of the first two modes, and exactly one of the last three (WMDM_CONTENT) modes. If both WMDM_MODE_BLOCK and WMDM_MODE_THREAD are specified, block mode is used.
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
     * <td>The operation is performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call will return immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * <tr>
     * <td>WMDM_CONTENT_FILE</td>
     * <td>The caller requests that Windows Media Device Manager read the file from the portable device into a file on the hard disk. The caller should indicate, in the <i>pwszFileName</i> parameter, the full path and name of the file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_CONTENT_FOLDER</td>
     * <td>The caller requests that Windows Media Device Manager read the specified folder, the contents, of the folder and the contents of any subfolders from the portable device onto the hard disk. The caller should indicate the full path of the target directory on the hard disk in the <i>pwszFileName</i> parameter.This is not currently supported by any Microsoft-provided service providers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>WMDM_CONTENT_OPERATIONINTERFACE</td>
     * <td>The application-implemented <b>IWMDMOperation</b> interface is being used to read data, instead of passing in a file name.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszFile Pointer to a fully qualified file name on the computer to which the content from the portable device is copied. The file name should include an extension; the extension from the current storage on the device will not be used. If WMDM_CONTENT_OPERATIONINTERFACE is specified in <i>fuMode</i>, this parameter is ignored.
     * @param {IWMDMProgress} pProgress Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface that has been implemented by the application to track the progress of ongoing operations.
     * @param {IWMDMOperation} pOperation Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmoperation">IWMDMOperation</a> interface, an optional set of methods used to enhance the transfer of content from a media device. This parameter must be <b>NULL</b> if WMDM_CONTENT_FILE or WMDM_CONTENT_FOLDER is specified in <i>fuMode</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol-read
     */
    Read(fuMode, pwszFile, pProgress, pOperation) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(6, this, "uint", fuMode, "ptr", pwszFile, "ptr", pProgress, "ptr", pOperation, "HRESULT")
        return result
    }

    /**
     * The Move method moves the current storage to a new location on the device.
     * @param {Integer} fuMode Processing mode by which to invoke the <b>Move</b> operation and the type of move to make. Specify exactly one of the following two modes. If both modes are specified, block mode is used.
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
     * <td>The operation is performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call will return immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following table lists flags that indicate where the object is moved to. One value from this table is combined with one value from the preceding Mode table using a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTBEFORE</td>
     * <td>The object is inserted before the target object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTINTO</td>
     * <td>The object is inserted into the target object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTAFTER</td>
     * <td>The object is inserted after the target object.</td>
     * </tr>
     * </table>
     * @param {IWMDMStorage} pTargetObject Pointer to the object before or after which you want to put the current object.
     * @param {IWMDMProgress} pProgress Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface that has been implemented by the application to track the progress of an ongoing operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol-move
     */
    Move(fuMode, pTargetObject, pProgress) {
        result := ComCall(7, this, "uint", fuMode, "ptr", pTargetObject, "ptr", pProgress, "HRESULT")
        return result
    }
}
