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
     * 
     * @param {PWSTR} pszStorageName 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     */
    GetStorage(pszStorageName, ppStorage) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(13, this, "ptr", pszStorageName, "ptr", ppStorage, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateStorage2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat, pwszName, qwFileSize, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(14, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "ptr", pwszName, "uint", qwFileSize, "ptr", ppNewStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Integer} dwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     */
    SetAttributes2(dwAttributes, dwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(15, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @param {Pointer<UInt32>} pdwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     */
    GetAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(16, this, "uint*", pdwAttributes, "uint*", pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
