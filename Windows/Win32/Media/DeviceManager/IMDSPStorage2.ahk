#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk

/**
 * The IMDSPStorage2 interface extends IMDSPStorage by providing methods for getting and setting extended attributes and making it possible to get a pointer to a storage medium from its name.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage2
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
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string containing the storage name.
     * @returns {IMDSPStorage} Pointer to the storage object specified by <i>pszStorageName</i>, or <b>NULL</b> if no such storage was found.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(13, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
    }

    /**
     * The CreateStorage2 method creates a new storage with the specified name and returns a pointer to the IMDSPStorage interface on the newly created storage.
     * @param {Integer} dwAttributes <b>DWORD</b> containing the attributes as described in the <b>IMDSPStorage::CreateStorage</b> method.
     * @param {Integer} dwAttributesEx <b>DWORD</b> containing the extended attributes. There are currently no extended attributes defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>_WAVEFORMATEX</b> structure that contains audio format information about the object. This parameter is optional and is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Pointer to a <b>_VIDEOINFOHEADER</b> structure that contains video format information about the object. This parameter is optional and is ignored if the file is not video.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the name for the new storage.
     * @param {Integer} qwFileSize <b>QWORD</b> containing the size of the file to create. If the total size of the output file is not known at the time of creation, this value will be set to zero.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer to receive the <b>IMDSPStorage</b> interface for the newly created storage.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage2-createstorage2
     */
    CreateStorage2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(14, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "ptr", pwszName, "uint", qwFileSize, "ptr*", &ppNewStorage := 0, "HRESULT")
        return IMDSPStorage(ppNewStorage)
    }

    /**
     * The SetAttributes2 method extends IMDSPStorage::SetAttributes by enabling you to set audio and video formats and extended attributes of a storage object.
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
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(15, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }

    /**
     * The GetAttributes2 method gets attributes of files or storages.
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
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }
}
