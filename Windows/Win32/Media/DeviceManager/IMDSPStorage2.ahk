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
     * 
     * @param {PWSTR} pszStorageName 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage2-getstorage
     */
    GetStorage(pszStorageName, ppStorage) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(13, this, "ptr", pszStorageName, "ptr*", ppStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Integer} dwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @param {PWSTR} pwszName 
     * @param {Integer} qwFileSize 
     * @param {Pointer<IMDSPStorage>} ppNewStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage2-createstorage2
     */
    CreateStorage2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(14, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "ptr", pwszName, "uint", qwFileSize, "ptr*", ppNewStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Integer} dwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(15, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAttributes 
     * @param {Pointer<Integer>} pdwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(16, this, "uint*", pdwAttributes, "uint*", pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }
}
