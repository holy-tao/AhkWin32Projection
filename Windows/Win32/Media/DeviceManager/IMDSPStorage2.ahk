#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk

/**
 * The IMDSPStorage2 interface extends IMDSPStorage by providing methods for getting and setting extended attributes and making it possible to get a pointer to a storage medium from its name.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspstorage2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage2 extends IMDSPStorage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage2
     * @type {Guid}
     */
    static IID => Guid("{0a5e07a5-6454-4451-9c36-1c6ae7e2b1d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorage", "CreateStorage2", "SetAttributes2", "GetAttributes2"]

    /**
     * The GetStorage method makes it possible to go directly to a storage object from a storage name instead of enumerating through all storages to find it.
     * @remarks
     * The <b>IMDSPStorage2::GetStorage</b> interface extends the functionality of <b>IMDSPStorage</b>.
     * 
     * <b>IMDSPStorage2::GetStorage</b> does not support wildcard characters. It is not recursive, that is, it will only find storage objects in the current storage.
     * 
     * If this method is not implemented, it should return E_NOTIMPL. (It should not return WMDM_E_NOT_SUPPORTED or any other codes indicating that this method is not implemented). This will ensure that Windows Media Device Manager will attempt to substitute this functionality itself by enumerating all storages to find a match based on the storage name passed in as <i>pszStorageName</i>.
     * 
     * It is strongly recommended that a service provider implement this method to efficiently return a storage object based on name.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string containing the storage name.
     * @returns {IMDSPStorage} Pointer to the storage object specified by <i>pszStorageName</i>, or <b>NULL</b> if no such storage was found.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(13, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppStorage)
    }

    /**
     * The CreateStorage2 method creates a new storage with the specified name and returns a pointer to the IMDSPStorage interface on the newly created storage.
     * @remarks
     * If both the WMDM_FILE_ATTR_FOLDER and WMDM_FILE_ATTR_FILE attributes are set, the folder attribute overrides the file attribute, and the new storage is created as a folder.
     * 
     * Only one of WMDM_STORAGECONTROL_INSERTBEFORE, WMDM_STORAGECONTROL_INSERTAFTER, and WMDM_STORAGECONTROL_INSERTINTO can be specified by the client.
     * 
     * The new storage can be created at the same level or can be inserted into the current storage, provided that the current storage is a folder. This is controlled by the value of the <i>dwAttributes</i> parameter. If it specifies WMDM_STORAGECONTROL_INSERTBEFORE or WMDM_STORAGECONTROL_INSERTAFTER, the new storage will be created at the same level as the current storage. If it specifies WMDM_STORAGECONTROL_INSERTINTO, the new storage will be inserted into the current storage.
     * 
     * WMDM_STORAGECONTROL_INSERTBEFORE and WMDM_STORAGECONTROL_INSERAFTER imply an ordering of content in the file system. If the file system does not support ordering (for example, FAT32) both the flags have the identical effect of inserting the new storage at the same level as the current storage. If the current storage represents the root of the storage medium, and one of these two flags is specified, the operation fails.
     * 
     * WMDM_STORAGECONTROL_INSERTINTO is valid only if the current storage is a folder. If the current storage is a file, and this flag is specified, the operation fails.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} dwAttributes <b>DWORD</b> containing the attributes as described in the <b>IMDSPStorage::CreateStorage</b> method.
     * @param {Integer} dwAttributesEx <b>DWORD</b> containing the extended attributes. There are currently no extended attributes defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains audio format information about the object. This parameter is optional and is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Pointer to a <b>_VIDEOINFOHEADER</b> structure that contains video format information about the object. This parameter is optional and is ignored if the file is not video.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the name for the new storage.
     * @param {Integer} qwFileSize <b>QWORD</b> containing the size of the file to create. If the total size of the output file is not known at the time of creation, this value will be set to zero.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer to receive the <b>IMDSPStorage</b> interface for the newly created storage.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage2-createstorage2
     */
    CreateStorage2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(14, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "ptr", pwszName, "uint", qwFileSize, "ptr*", &ppNewStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppNewStorage)
    }

    /**
     * The SetAttributes2 method extends IMDSPStorage::SetAttributes by enabling you to set audio and video formats and extended attributes of a storage object.
     * @remarks
     * See Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes">IWMDMStorage::SetAttributes</a>.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} dwAttributes <b>DWORD</b> containing the attributes to be set as defined in the <b>IWMDMStorage::SetAttributes</b> method
     * @param {Integer} dwAttributesEx <b>DWORD</b> containing the extended attributes. No extended attributes are currently defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains audio format information about the object. This parameter is optional and is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Pointer to a <b>_VIDEOINFOHEADER</b> structure that contains video format information about the object. This parameter is optional and is ignored if the file is not video.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(15, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAttributes2 method gets attributes of files or storages.
     * @remarks
     * See remarks for <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes">IWMDMStorage::GetAttributes</a>.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Integer>} pdwAttributes Pointer to a <b>DWORD</b> containing the base attributes as defined in the <b>IWMDMStorage::GetAttributes</b> method.
     * @param {Pointer<Integer>} pdwAttributesEx Pointer to a <b>DWORD</b> containing the extended attributes. Currently no extended attributes are defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains audio format information about the object. This parameter is optional and is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Pointer to a <b>_VIDEOINFOHEADER</b> structure that contains video format information about the object. This parameter is optional and is ignored if the file is not video.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
