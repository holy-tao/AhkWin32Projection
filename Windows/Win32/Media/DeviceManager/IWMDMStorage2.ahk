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
     * 
     * @param {PWSTR} pszStorageName 
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-getstorage
     */
    GetStorage(pszStorageName, ppStorage) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(12, this, "ptr", pszStorageName, "ptr*", ppStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Integer} dwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-setattributes2
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pFormat, pVideoFormat) {
        result := ComCall(13, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAttributes 
     * @param {Pointer<Integer>} pdwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage2-getattributes2
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }
}
