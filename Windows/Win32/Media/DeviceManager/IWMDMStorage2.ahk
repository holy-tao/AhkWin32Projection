#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorage.ahk

/**
 * The IWMDMStorage2 interface extends IWMDMStorage by making it possible to get a child storage by name, and to get and set extended attributes. IWMDMStorage3 interface extends this interface by supporting metadata.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage2 extends IWMDMStorage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage2
     * @type {Guid}
     */
    static IID => Guid("{1ed5a144-5cd5-4683-9eff-72cbdb2d9533}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorage", "SetAttributes2", "GetAttributes2"]

    /**
     * The GetStorage method retrieves a child storage by name directly from the current storage without having to enumerate through all the children.
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string specifying the storage name. This is the name retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getname">IWMDMStorage::GetName</a>.
     * @returns {IWMDMStorage} Pointer to the retrieved storage object, or <b>NULL</b> if no storage was found. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(12, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * The SetAttributes2 method sets extended attributes of the storage.
     * @param {Integer} dwAttributes <b>DWORD</b> specifying the base attributes defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes">IWMDMStorage::SetAttributes</a> method.
     * @param {Integer} dwAttributesEx <b>DWORD</b> specifying extended attributes. Currently, no extended attributes are defined.
     * @param {Pointer<WAVEFORMATEX>} pFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_ WAVEFORMATEX</a> structure that specifies audio information about the object. This parameter is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-videoinfoheader">_VIDEOINFOHEADER</a> structure that specifies video information about the object. This parameter is ignored if the file is not video.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pFormat, pVideoFormat) {
        result := ComCall(13, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }

    /**
     * The GetAttributes2 method retrieves extended attributes of the storage.
     * @param {Pointer<Integer>} pdwAttributes Pointer to a <b>DWORD</b> specifying one or more attributes defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes">IWMDMStorage::GetAttributes</a> method, combined with a bitwise <b>OR</b>.
     * @param {Pointer<Integer>} pdwAttributesEx Pointer to a <b>DWORD</b> specifying the extended attributes. Currently, no extended attributes are defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_ WAVEFORMATEX</a> structure that specifies audio information about the object. This parameter is ignored if the file is not audio.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-videoinfoheader">_ VIDEOINFOHEADER</a> structure that specifies video information about the object. This parameter is ignored if the file is not video.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }
}
