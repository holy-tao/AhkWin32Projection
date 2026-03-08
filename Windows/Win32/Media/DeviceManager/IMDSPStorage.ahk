#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorageGlobals.ahk
#Include .\WMDMDATETIME.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPEnumStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorage interface provides an instanced-based association with a storage medium on a device.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a16-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttributes", "GetStorageGlobals", "GetAttributes", "GetName", "GetDate", "GetSize", "GetRights", "CreateStorage", "EnumStorage", "SendOpaqueCommand"]

    /**
     * The SetAttributes method sets the attributes of a storage object.
     * @remarks
     * Many of the attributes returned by <b>GetAttributes</b> (as listed in attribute table for <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes">IWMDMStorage::GetAttributes</a>) cannot be set, so they are not listed in the attribute table for <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes">IWMDMStorage::SetAttributes</a>.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} dwAttributes <b>DWORD</b> containing the attributes to be set as defined in the <b>IWMDMStorage::SetAttributes</b> method.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains attribute information about the object. This parameter is optional and is ignored if the file is not audio.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-setattributes
     */
    SetAttributes(dwAttributes, pFormat) {
        result := ComCall(3, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The GetStorageGlobals method retrieves the IMDSPStorageGlobals interface to provide access to global information about a storage medium.
     * @remarks
     * The <b>IMDSPStorageGlobals</b> interface provides methods for accessing global information about the medium regardless of the nesting level of the <b>IMDSPStorage</b> interface from which the global view is accessed. Any instance of <b>IMDSPStorage</b> can acquire an <b>IMDSPStorageGlobals</b> interface.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPStorageGlobals} Pointer to an <b>IMDSPStorageGlobals</b> interface that can provide access to global information about a storage medium.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getstorageglobals
     */
    GetStorageGlobals() {
        result := ComCall(4, this, "ptr*", &ppStorageGlobals := 0, "HRESULT")
        return IMDSPStorageGlobals(ppStorageGlobals)
    }

    /**
     * The GetAttributes method retrieves the attributes of this storage object.
     * @remarks
     * Evaluation of attributes is a crucial step when exposing the contents of the media device. Devices may not support hierarchical storage of data on storage media. The <b>GetAttributes</b> method allows the application to infer the support and format of the file system by discovering its structure through object attributes.
     * 
     * For example, the attributes of a top-level <b>IMDSPStorage</b> interface indicate a storage medium, and <b>IMDSPEnumStorage</b> exposes the contents of the medium. For an .mp3 file, the attributes indicate a file whose type can be determined by further examination of both the attributes and the file name. In a hierarchical medium, the attributes can indicate a directory whose contents can be exposed by <b>IMDSPStorage::EnumStorage</b>.
     * 
     * The <b>_WAVEFORMATEX</b> parameter is optional. If you pass a valid <b>_WAVEFORMATEX</b> pointer to an audio file, <b>GetAttributes</b> passes descriptive information back into the structure. However, if the file is not audio, the <b>_WAVEFORMATEX</b> parameter is ignored.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <b>_WAVEFORMATEX</b> structure that is filled with attribute information about the object.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the attributes as defined by in the <b>IWMDMStorage::GetAttributes</b> method.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getattributes
     */
    GetAttributes(pFormat) {
        result := ComCall(5, this, "uint*", &pdwAttributes := 0, "ptr", pFormat, "HRESULT")
        return pdwAttributes
    }

    /**
     * The GetName method retrieves the display name of the storage object.
     * @remarks
     * The display name of the object is the file name without path information. In hierarchical media the display name would be concatenated with the ancestor instances of <b>IMDSPStorage</b> interfaces to create a full path-qualified name.
     * 
     * The <b>LPWSTR</b> string type is a 16-bit Unicode character string and does not accept byte-sized characters.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {PWSTR} pwszName Pointer to a (Unicode) wide-character null-terminated string containing the object name.
     * @param {Integer} nMaxChars Integer containing the maximum number of characters that can be copied to the name string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetDate method retrieves the date on which the storage object (file or folder) was most recently modified.
     * @remarks
     * The time is specified in coordinated universal time.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {WMDMDATETIME} Pointer to a <b>WMDMDATETIME</b> structure containing the date on which the file or folder was most recently modified.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getdate
     */
    GetDate() {
        pDateTimeUTC := WMDMDATETIME()
        result := ComCall(7, this, "ptr", pDateTimeUTC, "HRESULT")
        return pDateTimeUTC
    }

    /**
     * The GetSize method retrieves the size of the storage object, in bytes.
     * @remarks
     * The object size is reported in bytes. The size is zero for folder objects.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Integer>} pdwSizeLow Pointer to a <b>DWORD</b> containing the low-order part of the storage object size.
     * @param {Pointer<Integer>} pdwSizeHigh Pointer to a <b>DWORD</b> containing the high-order part of the storage object size.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getsize
     */
    GetSize(pdwSizeLow, pdwSizeHigh) {
        pdwSizeLowMarshal := pdwSizeLow is VarRef ? "uint*" : "ptr"
        pdwSizeHighMarshal := pdwSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwSizeLowMarshal, pdwSizeLow, pdwSizeHighMarshal, pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * The GetRights method retrieves the rights information for an object.
     * @remarks
     * Object rights describe the usage permissions for media content. For example, the <b>WMDMRIGHTS</b> structure can contain information concerning how many times a file can be played and who can play it.
     * 
     * The <i>ppRights</i> array is allocated by this method, and must be freed by the application using <b>CoTaskMemFree</b>, a standard Win32 function.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights Pointer to an array of <b>WMDMRIGHTS</b> structures that contain the storage object rights information. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} pnRightsCount Pointer to the number of <b>WMDMRIGHTS</b> structures in the <i>ppRights</i> array. This parameter is included in the output message authentication code.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getrights
     */
    GetRights(ppRights, pnRightsCount, abMac) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The CreateStorage method creates a new storage and returns a pointer to the IMDSPStorage interface on the newly created storage.
     * @remarks
     * If both the WMDM_FILE_ATTR_FOLDER and WMDM_FILE_ATTR_FILE attributes are set, the folder attribute overrides the file attribute, and the new storage is created as a folder.
     * 
     * Only one of WMDM_STORAGECONTROL_INSERTBEFORE, WMDM_STORAGECONTROL_INSERTAFTER, and WMDM_STORAGECONTROL_INSERTINTO can be specified by the client.
     * 
     * The new storage can be created at the same level or can be inserted into the current storage provided that the current storage is a folder. This is controlled by the value of <i>dwAttributes</i> parameter. If it specifies WMDM_STORAGECONTROL_INSERTBEFORE or WMDM_STORAGECONTROL_INSERTAFTER, the new storage will be created at the same level as the current storage. If it specifies WMDM_STORAGECONTROL_INSERTINTO, the new storage will be inserted into the current storage.
     * 
     * WMDM_STORAGECONTROL_INSERTBEFORE and WMDM_STORAGECONTROL_INSERAFTER imply an ordering of content in the file system. If the file system does not support ordering (for example, FAT32) both the flags have the identical effect of inserting the new storage at the same level of the current storage. If the current storage represents the root of the storage medium, and one of these two flags is specified, the operation fails.
     * 
     * WMDM_STORAGECONTROL_INSERTINTO is valid only if the current storage is a folder. If the current storage is a file, and this flag is specified, the operation fails.
     * @param {Integer} dwAttributes <b>DWORD</b> containing the attributes for the new storage. The following table lists the available storage attributes.
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
     * <td>This object is the top-level storage medium (for example, a storage card or some other on-board storage.)</td>
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
     * <td>This file or folder can be moved around on the storage medium.</td>
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
     * <td>WMDM_FILE_ATTR_VIDEO</td>
     * <td>This file contains video data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_HIDDEN</td>
     * <td>This file is hidden on the file system</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_SYSTEM</td>
     * <td>This is a system file</td>
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
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains information about the object, if the object is an audio file.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the name for the new storage.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer to receive the <b>IMDSPStorage</b> interface for the newly created storage.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-createstorage
     */
    CreateStorage(dwAttributes, pFormat, pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "uint", dwAttributes, "ptr", pFormat, "ptr", pwszName, "ptr*", &ppNewStorage := 0, "HRESULT")
        return IMDSPStorage(ppNewStorage)
    }

    /**
     * The EnumStorage method accesses the IMDSPEnumStorage interface to enumerate the individual storage media on a device.
     * @remarks
     * The <b>IMDSPEnumStorage</b> interface returned will enumerate the nested storages in the storage that <b>IMDSPStorage</b> corresponds to. Thus all the storage objects in a hierarchical structure can be retrieved recursively.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPEnumStorage} Pointer to an <b>IMDSPEnumStorage</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-enumstorage
     */
    EnumStorage() {
        result := ComCall(11, this, "ptr*", &ppEnumStorage := 0, "HRESULT")
        return IMDSPEnumStorage(ppEnumStorage)
    }

    /**
     * The SendOpaqueCommands method sends a command through Windows Media Device Manager. Without acting on it, Windows Media Device Manager passes the command through to a device.
     * @remarks
     * This method is used with device commands that do not affect Windows Media Device Manager, and are passed through unchanged.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<OPAQUECOMMAND>} pCommand Pointer to an <b>OPAQUECOMMAND</b> structure containing the information required to execute the command.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(12, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
