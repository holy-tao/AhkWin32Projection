#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPStorage3.ahk

/**
 * The IMDSPStorage4 interface extends IMDSPStorage3 for supporting virtual storages (such as playlists and albums) and metadata.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspstorage4
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
     * @remarks
     * Any valid <b>IMDSPStorage</b> object may be contained in the <i>ppIMDSPStorage</i> array. This includes folders and other storages containing references themselves (creating, for example, a playlist of playlists).
     * 
     * Depending upon the level of support in the device (whether it supports playlists or nested playlists), the service provider should handle this method appropriately. If the device does not have the level of supported needed for the passed-in reference array, the service provider should return WMDM_E_NOTSUPPORTED.
     * 
     * If the reference contains a deleted storage, WMDM_E_INTERFACEDEAD should be returned.
     * 
     * The <b>SetReferences</b> method follows a wipe-and-load model. The references passed include a complete set and should replace any existing references on the storage object completely.
     * @param {Integer} dwRefs Count of <b>IMDSPStorage</b> interface pointers contained in the passed-in array. Zero is an acceptable value and resets the storage to contain zero references. The storage itself is not deleted in this case.
     * @param {Pointer<IMDSPStorage>} ppISPStorage Pointer to an array of <b>IMDSPStorage</b> interface pointers used to set references in a storage. The ordering of references matches the ordering of the corresponding <b>IWMDMStorage</b> interface pointers in this array. <b>NULL</b> is an acceptable value if <i>dwRefs</i> is also zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-setreferences
     */
    SetReferences(dwRefs, ppISPStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr*", ppISPStorage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetReferences method returns an array of pointers to IMDSPStorage objects comprising the references contained in an association storage, such as one representing playlist or album objects.
     * @remarks
     * Windows Media Device Manager uses this method for obtaining the references on an association storage such as a playlist or an album.
     * 
     * If the storage has references to one or more items that have been deleted from the device, the SP should not include these references in the references returned. The SP should indicate such condition by returning S_FALSE. The application might choose to refresh the association storage object by using the known-good references returned here. The SP can also refresh the references itself.
     * 
     * If the count of references is 0, service provider must return an array of references with 0 elements in it.
     * @param {Pointer<Integer>} pdwRefs Pointer to the count of <b>IWMDMStorage</b> interface pointers being returned in <i>pppIWMDMStorage</i>.
     * @param {Pointer<Pointer<IMDSPStorage>>} pppISPStorage Pointer to a pointer to the array of <b>IWMDMStorage</b> interface pointers that represent references on a storage. Such references can, for example, represent items in a playlist or album. The ordering of references matches the ordering in this array. Memory for this array should be allocated by the service provider.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-getreferences
     */
    GetReferences(pdwRefs, pppISPStorage) {
        pdwRefsMarshal := pdwRefs is VarRef ? "uint*" : "ptr"
        pppISPStorageMarshal := pppISPStorage is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, pdwRefsMarshal, pdwRefs, pppISPStorageMarshal, pppISPStorage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CreateStorageWithMetadata method creates a new storage, applying the given metadata to the new storage, and returns a pointer to the IMDSPStorage interface on the newly created storage.
     * @remarks
     * This method is useful if metadata needs to be applied to storage at the creation time. In contrast, the <b>IMDSPStorage2::CreateStorage2</b> and <b>IMDSPStorage::CreateStorage</b> methods do not provide a way for supplying metadata at creation time.
     * 
     * If service provider for a device that can synchronize with Windows Media Player supports this interface, Windows Media Device Manager calls this method during <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-insert">Insert</a>/2/3 operations.
     * 
     * If both the WMDM_FILE_ATTR_FOLDER and WMDM_FILE_ATTR_FILE attributes are set, the folder attribute overrides the file attribute, and the new storage is created as a folder.
     * 
     * Only one of WMDM_STORAGECONTROL_INSERTBEFORE, WMDM_STORAGECONTROL_INSERTAFTER, and WMDM_STORAGECONTROL_INSERTINTO can be specified by the client.
     * 
     * The new storage can be created at the same level or can be inserted into the current storage provided that the current storage is a folder. This is controlled by the value of <i>dwAttributes</i> parameter. If it specifies WMDM_STORAGECONTROL_INSERTBEFORE or WMDM_STORAGECONTROL_INSERTAFTER, the new storage will be created at the same level as the current storage. If it specifies WMDM_STORAGECONTROL_INSERTINTO, the new storage will be inserted into the current storage.
     * 
     * WMDM_STORAGECONTROL_INSERTBEFORE and WMDM_STORAGECONTROL_INSERAFTER imply an ordering of content in the file system. If the file system does not support ordering (for example, the FAT32 file system), both flags have the identical effect of inserting the new storage at the level of the current storage. If the current storage represents the root of the storage medium and one of these two flags is specified, the operation fails.
     * 
     * WMDM_STORAGECONTROL_INSERTINTO is valid only if the current storage is a folder. If the current storage is a file and this flag is specified, the operation fails.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-createstoragewithmetadata
     */
    CreateStorageWithMetadata(dwAttributes, pwszName, pMetadata, qwFileSize) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(21, this, "uint", dwAttributes, "ptr", pwszName, "ptr", pMetadata, "uint", qwFileSize, "ptr*", &ppNewStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppNewStorage)
    }

    /**
     * The GetSpecifiedMetadata method retrieves only the specified metadata object for a storage.
     * @remarks
     * This method gives the client control over which properties are retrieved. The client can specify the property names for the properties that the client needs to retrieve.
     * 
     * In contrast, the <b>GetMetadata</b> method retrieves all the storage metadata (properties).
     * 
     * If none of the specified properties can be returned, the service provider should return WMDM_E_NOTSUPPORTED or any suitable error code.
     * 
     * If at least one property can be retrieved, the service provider should return that property and set the return code to a success code of WMDM_S_NOT_ALL_PROPERTIES_RETRIEVED.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-getspecifiedmetadata
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames, pMetadata) {
        ppwszPropNamesMarshal := ppwszPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "uint", cProperties, ppwszPropNamesMarshal, ppwszPropNames, "ptr", pMetadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FindStorage method finds a storage with the given persistent unique identifier. The persistent unique identifier of a storage is described by the g_wszWMDMPersistentUniqueID property of that storage. (IMDSPStorage4.FindStorage)
     * @remarks
     * The service provider returns a persistent unique identifier through the <b>g_wszWMDMPersistentUniqueID</b> property of the storage. For a specific storage, the persistent unique identifier supplied by service provider should be the same across different device connect sessions.
     * 
     * The application may call <b>FindStorage</b> with this persistent unique identifier at a later point. In response, Windows Media Device Manager calls this method on the service provider.
     * 
     * A persistent unique identifier is used to uniquely identify content stored on a particular device. It does not represent a content-specific globally unique identifier that remains identical across all devices. Thus, the same content stored in different storages will have different persistent unique identifiers.
     * 
     * This method allows searching for a storage based on persistent unique identifier while <b>IMDSPStorage2::GetStorage</b> allows searching for a storage based on name.
     * 
     * Windows Media Device Manager calls this method only for devices that can be synchronized with Windows Media Player. See <a href="https://docs.microsoft.com/windows/desktop/WMDM/enabling-synchronization-with-windows-media-player">Enabling Synchronization with Windows Media Player</a> for more information.
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID Persistent unique identifier of the storage.
     * @returns {IMDSPStorage} Pointer to the returned storage specified by the <i>pwszUniqueID</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppStorage)
    }

    /**
     * The GetParent method retrieves the parent of the current storage.
     * @remarks
     * This method can be used to traverse the complete hierarchy of the current storage if used recursively.
     * 
     * When this method is called for root storage, this method should return S_FALSE and set <i>ppStorage</i> to <b>NULL</b>.
     * @returns {IMDSPStorage} Pointer to the returned parent storage object.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage4-getparent
     */
    GetParent() {
        result := ComCall(24, this, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppStorage)
    }
}
