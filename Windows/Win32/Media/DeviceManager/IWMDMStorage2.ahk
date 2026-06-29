#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\VIDEOINFOHEADER.ahk" { VIDEOINFOHEADER }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWMDMStorage.ahk" { IWMDMStorage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * The IWMDMStorage2 interface extends IWMDMStorage by making it possible to get a child storage by name, and to get and set extended attributes. IWMDMStorage3 interface extends this interface by supporting metadata.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmstorage2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMStorage2 extends IWMDMStorage {
    /**
     * The interface identifier for IWMDMStorage2
     * @type {Guid}
     */
    static IID := Guid("{1ed5a144-5cd5-4683-9eff-72cbdb2d9533}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMStorage2 interfaces
    */
    struct Vtbl extends IWMDMStorage.Vtbl {
        GetStorage     : IntPtr
        SetAttributes2 : IntPtr
        GetAttributes2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMStorage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStorage method retrieves a child storage by name directly from the current storage without having to enumerate through all the children.
     * @remarks
     * <b>IWMDMStorage2::GetStorage</b> does not support wildcard characters. It is not recursive; that is, it will only find storages that are immediate children of the current storage. To find a storage more than one level deep, try <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-findstorage">IWMDMDevice3::FindStorage</a>.
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string specifying the storage name. This is the name retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getname">IWMDMStorage::GetName</a>.
     * @returns {IWMDMStorage} Pointer to the retrieved storage object, or <b>NULL</b> if no storage was found. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-getstorage
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pFormat, pVideoFormat) {
        result := ComCall(13, this, "uint", dwAttributes, "uint", dwAttributesEx, WAVEFORMATEX.Ptr, pFormat, VIDEOINFOHEADER.Ptr, pVideoFormat, "HRESULT")
        return result
    }

    /**
     * The GetAttributes2 method retrieves extended attributes of the storage.
     * @remarks
     * Evaluation of attributes is a crucial step when exposing the contents of the media device. Some devices do not support hierarchical storage of data on storage media. The <b>GetAttributes2</b> method is used to infer the support and format of the file system by discovering its structure through object attributes.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, WAVEFORMATEX.Ptr, pAudioFormat, VIDEOINFOHEADER.Ptr, pVideoFormat, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMStorage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStorage := CallbackCreate(GetMethod(implObj, "GetStorage"), flags, 3)
        this.vtbl.SetAttributes2 := CallbackCreate(GetMethod(implObj, "SetAttributes2"), flags, 5)
        this.vtbl.GetAttributes2 := CallbackCreate(GetMethod(implObj, "GetAttributes2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStorage)
        CallbackFree(this.vtbl.SetAttributes2)
        CallbackFree(this.vtbl.GetAttributes2)
    }
}
