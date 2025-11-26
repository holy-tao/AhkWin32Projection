#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorageControl.ahk

/**
 * The IWMDMStorageControl2 interface extends IWMDMStorageControl by making it possible to set the name of the destination file when inserting content into a storage.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl2 extends IWMDMStorageControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageControl2
     * @type {Guid}
     */
    static IID => Guid("{972c2e88-bd6c-4125-8e09-84f837e637b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Insert2"]

    /**
     * The Insert2 method puts content into/next to the storage. This method extends IWMDMStorageControl::Insert by allowing the application to specify a new destination name, and provide a pointer to a custom COM object.
     * @param {Integer} fuMode Processing mode used for the <b>Insert2</b> operation. The following table lists the processing modes that can be specified in the <b>fuMode</b> parameter. You must specify exactly one of the first two modes, exactly one of the STORAGECONTROL modes, and exactly one of the CONTENT modes. If both WMDM_MODE_BLOCK and WMDM_MODE_THREAD are specified, block mode is used.
     * 
     * <table>
     * <tr>
     * <th>Combinations
     *                 </th>
     * <th>Mode
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>Exactly one of:</td>
     * <td>WMDM_MODE_BLOCK</td>
     * <td>The operation is performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call will return immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * <tr>
     * <td>Optional</td>
     * <td>WMDM_MODE_QUERY</td>
     * <td>A test is performed to determine whether the insert operation could succeed, but the insert will not be performed.</td>
     * </tr>
     * <tr>
     * <td>Exactly one of:</td>
     * <td>WMDM_STORAGECONTROL_INSERTBEFORE</td>
     * <td>The object is inserted before the target object.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_STORAGECONTROL_INSERTAFTER</td>
     * <td>The object is inserted after the target object.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_STORAGECONTROL_INSERTINTO</td>
     * <td>The object is inserted into the current object. This will only work if the current object is a folder.</td>
     * </tr>
     * <tr>
     * <td>Optional</td>
     * <td>WMDM_FILE_CREATE_OVERWRITE</td>
     * <td>The object will replace the target object.</td>
     * </tr>
     * <tr>
     * <td>Exactly one of:</td>
     * <td>WMDM_CONTENT_FILE</td>
     * <td>The content being inserted is a file.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_CONTENT_FOLDER</td>
     * <td>The content being inserted is a folder. This will not transfer the contents of the folder.</td>
     * </tr>
     * <tr>
     * <td>Optional</td>
     * <td>WMDM_CONTENT_OPERATIONINTERFACE</td>
     * <td>The content being inserted is an operation interface. The data for the content should be written to the application-implemented <b>IWMDMOperation</b> interface.</td>
     * </tr>
     * <tr>
     * <td>Optional</td>
     * <td>WMDM_MODE_PROGRESS</td>
     * <td>Progress notifications should be sent through the <i>pProgress</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>Optional one of:</td>
     * <td>WMDM_MODE_TRANSFER_PROTECTED</td>
     * <td>The insertion is in protected transfer mode.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_MODE_TRANSFER_UNPROTECTED</td>
     * <td>The insertion is in unprotected transfer mode.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszFileSource Pointer to a wide-character, <b>null</b>-terminated string indicating the full name and path of the object to send to the device. This parameter must be <b>NULL</b> if WMDM_CONTENT_OPERATIONINTERFACE is specified in <i>fuMode</i>.
     * @param {PWSTR} pwszFileDest Optional name of file on the device. If not specified and the application passes an <b>IWMDMOperation</b> pointer to <i>pOperation</i>, Windows Media Device Manager will request a destination name by calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmoperation-getobjectname">IWMDMOperation::GetObjectName</a>. If not specified and the application does not use <i>pOperation</i>, the original file name and extension are used (without the path).
     * @param {IWMDMOperation} pOperation Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmoperation">IWMDMOperation</a> interface, to control the transfer of content to a media device. If specified, <i>fuMode</i> must include the WMDM_CONTENT_OPERATIONINTERFACE flag. This parameter must be <b>NULL</b> if WMDM_CONTENT_FILE or WMDM_CONTENT_FOLDER is specified in <i>fuMode</i>.
     * @param {IWMDMProgress} pProgress Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface to report action progress back to the application. If specified, <i>fuMode</i> should include WMDM_MODE_PROGRESS.
     * @param {IUnknown} pUnknown Optional <b>IUnknown</b> pointer of any custom COM object to be passed to the secure content provider. This makes it possible to pass custom information to a secure content provider if the application has sufficient information about the secure content provider.
     * @param {Pointer<IWMDMStorage>} ppNewObject Pointer to an <b>IWMDMStorage</b> interface that will contain the new content. The caller must release this interface when finished with it.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol2-insert2
     */
    Insert2(fuMode, pwszFileSource, pwszFileDest, pOperation, pProgress, pUnknown, ppNewObject) {
        pwszFileSource := pwszFileSource is String ? StrPtr(pwszFileSource) : pwszFileSource
        pwszFileDest := pwszFileDest is String ? StrPtr(pwszFileDest) : pwszFileDest

        result := ComCall(8, this, "uint", fuMode, "ptr", pwszFileSource, "ptr", pwszFileDest, "ptr", pOperation, "ptr", pProgress, "ptr", pUnknown, "ptr*", ppNewObject, "HRESULT")
        return result
    }
}
