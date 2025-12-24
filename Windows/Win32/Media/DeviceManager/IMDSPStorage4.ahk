#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPStorage3.ahk

/**
 * The IMDSPStorage4 interface extends IMDSPStorage3 for supporting virtual storages (such as playlists and albums) and metadata.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage4
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage4 extends IMDSPStorage3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage4
     * @type {Guid}
     */
    static IID => Guid("{3133b2c4-515c-481b-b1ce-39327ecb4f74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetReferences", "GetReferences", "CreateStorageWithMetadata", "GetSpecifiedMetadata", "FindStorage", "GetParent"]

    /**
     * The SetReferences method sets the references contained in a storage that has references (such as playlist/album), overwriting any previously existing references contained in this storage.
     * @param {Integer} dwRefs Count of <b>IMDSPStorage</b> interface pointers contained in the passed-in array. Zero is an acceptable value and resets the storage to contain zero references. The storage itself is not deleted in this case.
     * @param {Pointer<IMDSPStorage>} ppISPStorage Pointer to an array of <b>IMDSPStorage</b> interface pointers used to set references in a storage. The ordering of references matches the ordering of the corresponding <b>IWMDMStorage</b> interface pointers in this array. <b>NULL</b> is an acceptable value if <i>dwRefs</i> is also zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-setreferences
     */
    SetReferences(dwRefs, ppISPStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppISPStorage, "HRESULT")
        return result
    }

    /**
     * The GetReferences method returns an array of pointers to IMDSPStorage objects comprising the references contained in an association storage, such as one representing playlist or album objects.
     * @param {Pointer<Integer>} pdwRefs Pointer to the count of <b>IWMDMStorage</b> interface pointers being returned in <i>pppIWMDMStorage</i>.
     * @param {Pointer<Pointer<IMDSPStorage>>} pppISPStorage Pointer to a pointer to the array of <b>IWMDMStorage</b> interface pointers that represent references on a storage. Such references can, for example, represent items in a playlist or album. The ordering of references matches the ordering in this array. Memory for this array should be allocated by the service provider.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-getreferences
     */
    GetReferences(pdwRefs, pppISPStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"
        pppISPStorageMarshal := pppISPStorage is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, pppISPStorageMarshal, pppISPStorage, "HRESULT")
        return result
    }

    /**
     * The CreateStorageWithMetadata method creates a new storage, applying the given metadata to the new storage, and returns a pointer to the IMDSPStorage interface on the newly created storage.
     * @param {Integer} dwAttributes <b>DWORD</b> containing attributes for the new storage. The following table lists the available storage attributes.
     * 
     * <table>
     * <tr>
     * <th>Attribute
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTBEFORE</td>
     * <td>The new storage object will be created in front of the target object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTAFTER</td>
     * <td>The new storage object will be created after the target object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_INSERTINTO</td>
     * <td>The new storage object will be created in the target object folder.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECONTROL_OVERWRITE</td>
     * <td>If storage with the same name already exists, it will be destroyed and a new storage created.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_FILESYSTEM</td>
     * <td>This object is the top-level storage medium (for example, a storage card or some other onboard storage.)</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_REMOVABLE</td>
     * <td>This storage medium is removable.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_CANEDITMETADATA</td>
     * <td>This storage can edit metadata.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_FOLDERS</td>
     * <td>This storage medium supports folders and file hierarchy.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FOLDER</td>
     * <td>This is a folder on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_LINK</td>
     * <td>This is a link that creates an association among multiple files.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FILE</td>
     * <td>This is a file on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_AUDIO</td>
     * <td>This file is audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_DATA</td>
     * <td>This file is non-audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANPLAY</td>
     * <td>This audio file can be played by the device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANDELETE</td>
     * <td>This file can be deleted.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANMOVE</td>
     * <td>This file or folder can be moved on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANRENAME</td>
     * <td>This file or folder can be renamed.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANREAD</td>
     * <td>This file can be read by the host computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_MUSIC</td>
     * <td>This audio file is music.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_PLAYLIST</td>
     * <td>This is a playlist object.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_VIDEO</td>
     * <td>This file contains video data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_HIDDEN</td>
     * <td>This file is hidden on the file system.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_SYSTEM</td>
     * <td>This is a system file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_READONLY</td>
     * <td>This is a read-only file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_IS_DEFAULT</td>
     * <td>This storage is the default storage where new media should be placed.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_CONTAINS_DEFAULT</td>
     * <td>This storage contains the default storage where new media should be placed.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszName Pointer to a wide-character, null-terminated string containing a name for the new storage.
     * @param {IWMDMMetaData} pMetadata Pointer to an <b>IWMDMMetaData</b> interface.
     * @param {Integer} qwFileSize <b>Qword</b> containing the file size.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer to receive the <b>IMDSPStorage</b> interface for the newly created storage.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-createstoragewithmetadata
     */
    CreateStorageWithMetadata(dwAttributes, pwszName, pMetadata, qwFileSize) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(21, this, "uint", dwAttributes, "ptr", pwszName, "ptr", pMetadata, "uint", qwFileSize, "ptr*", &ppNewStorage := 0, "HRESULT")
        return IMDSPStorage(ppNewStorage)
    }

    /**
     * The GetSpecifiedMetadata method retrieves only the specified metadata object for a storage.
     * @param {Integer} cProperties Count of properties to be retrieved.
     * @param {Pointer<PWSTR>} ppwszPropNames Array that contains the property names to be retrieved. The size of this array should be equal to <i>cProperties</i>.
     * @param {IWMDMMetaData} pMetadata Pointer to the returned <b>IWMDMMetaData</b> interface pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames, pMetadata) {
        ppwszPropNamesMarshal := ppwszPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "uint", cProperties, ppwszPropNamesMarshal, ppwszPropNames, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * The FindStorage method finds a storage with the given persistent unique identifier. The persistent unique identifier of a storage is described by the g_wszWMDMPersistentUniqueID property of that storage.
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage.
     * @returns {IMDSPStorage} Pointer to the returned storage specified by the <i>pwszUniqueID</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
    }

    /**
     * The GetParent method retrieves the parent of the current storage.
     * @returns {IMDSPStorage} Pointer to the returned parent storage object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage4-getparent
     */
    GetParent() {
        result := ComCall(24, this, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
    }
}
