#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorageControl2.ahk

/**
 * The IWMDMStorageControl3 interface extends IWMDMStorageControl2 by providing an Insert method that accepts an IWMDMMetaData interface pointer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl3 extends IWMDMStorageControl2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageControl3
     * @type {Guid}
     */
    static IID => Guid("{b3266365-d4f3-4696-8d53-bd27ec60993a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Insert3"]

    /**
     * The Insert3 method puts content into/next to the storage. This method extends IWMDMStorageControl2::Insert2 by allowing the application to explicitly specify the metadata and type of the object being sent.
     * @param {Integer} fuMode Processing mode used for the <b>Insert3</b> operation. The following table lists the processing modes that can be specified in the <i>fuMode</i> parameter. You must specify exactly one of the first two modes, exactly one of the STORAGECONTROL modes, and exactly one of the CONTENT modes. If both WMDM_MODE_BLOCK and WMDM_MODE_THREAD are specified, block mode is used. Specifying the WMDM_FILE_ATTR* flags in this function is more efficient than calling this function first, then setting these attributes on the file after it has been created or sent.
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
     * <td>The application is passing in an <b>IWMDMOperation</b> interface to control data transfer.</td>
     * </tr>
     * <tr>
     * <td>Zero or more of:</td>
     * <td>WMDM_FILE_ATTR_READONLY</td>
     * <td>The storage should be set to read-only on the device.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_FILE_ATTR_HIDDEN</td>
     * <td>The storage should be set to hidden on the device.</td>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>WMDM_FILE_ATTR_SYSTEM</td>
     * <td>The storage should be set to system on the device.</td>
     * </tr>
     * <tr>
     * <td>Optional</td>
     * <td>WMDM_MODE_PROGRESS</td>
     * <td>The insertion is in progress.</td>
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
     * @param {Integer} fuType One of the following types, specifying the current storage.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FILE</td>
     * <td>The current storage is a file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FOLDER</td>
     * <td>The current storage is a folder.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszFileSource Pointer to a wide-character, <b>null</b>-terminated string indicating where to find the content for the insert operation. This parameter must be <b>NULL</b> if WMDM_CONTENT_OPERATIONINTERFACE is specified in <i>fuMode</i>. This parameter can be <b>NULL</b> if a playlist or album is being created.
     * @param {PWSTR} pwszFileDest Optional name of file on the device. If not specified and the application passes an <b>IWMDMOperation</b> pointer to <i>pOperation</i>, Windows Media Device Manager will request a destination name by calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmoperation-getobjectname">IWMDMOperation::GetObjectName</a>. If not specified and the application does not use <i>pOperation</i>, the original file name and extension are used (without the path).
     * @param {IWMDMOperation} pOperation Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmoperation">IWMDMOperation</a> interface, to control the transfer of content to a media device. If specified, <i>fuMode</i> must include the WMDM_CONTENT_OPERATIONINTERFACE flag. This parameter must be <b>NULL</b> if WMDM_CONTENT_FILE or WMDM_CONTENT_FOLDER is specified in <i>fuMode</i>.
     * @param {IWMDMProgress} pProgress Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmprogress">IWMDMProgress</a> interface to report action progress back to the application. This parameter can be <b>NULL</b>.
     * @param {IWMDMMetaData} pMetaData Optional pointer to a metadata object. Create a new metadata object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject">IWMDMStorage3::CreateEmptyMetadataObject</a>. This parameter allows an application to specify metadata (including format) to set on the device during object creation on the device, which is more efficient than setting metadata afterward. You must set the file format (specified by g_wszWMDMFormatCode). If you do not specify the format code of a file when using this method, an MTP device will not show the file as present in its user interface, and non-MTP devices will behave unpredictably.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstoragecontrol3-insert3
     */
    Insert3(fuMode, fuType, pwszFileSource, pwszFileDest, pOperation, pProgress, pMetaData, pUnknown, ppNewObject) {
        pwszFileSource := pwszFileSource is String ? StrPtr(pwszFileSource) : pwszFileSource
        pwszFileDest := pwszFileDest is String ? StrPtr(pwszFileDest) : pwszFileDest

        result := ComCall(9, this, "uint", fuMode, "uint", fuType, "ptr", pwszFileSource, "ptr", pwszFileDest, "ptr", pOperation, "ptr", pProgress, "ptr", pMetaData, "ptr", pUnknown, "ptr*", ppNewObject, "HRESULT")
        return result
    }
}
