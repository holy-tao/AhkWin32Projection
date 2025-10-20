#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPDevice.ahk

/**
 * The IMDSPDevice2 interface extends IMDSPDevice by getting extended formats, getting Plug and Play (PnP) device names, enabling the use of property pages, and making it possible to get a pointer to a storage medium from its name.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice2 extends IMDSPDevice{
    /**
     * The interface identifier for IMDSPDevice2
     * @type {Guid}
     */
    static IID => Guid("{420d16ad-c97d-4e00-82aa-00e9f4335ddd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {PWSTR} pszStorageName 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     */
    GetStorage(pszStorageName, ppStorage) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr", ppStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<WAVEFORMATEX>} ppAudioFormatEx 
     * @param {Pointer<UInt32>} pnAudioFormatCount 
     * @param {Pointer<VIDEOINFOHEADER>} ppVideoFormatEx 
     * @param {Pointer<UInt32>} pnVideoFormatCount 
     * @param {Pointer<WMFILECAPABILITIES>} ppFileType 
     * @param {Pointer<UInt32>} pnFileTypeCount 
     * @returns {HRESULT} 
     */
    GetFormatSupport2(dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount) {
        result := ComCall(15, this, "uint", dwFlags, "ptr", ppAudioFormatEx, "uint*", pnAudioFormatCount, "ptr", ppVideoFormatEx, "uint*", pnVideoFormatCount, "ptr", ppFileType, "uint*", pnFileTypeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpecifyPropertyPages>} ppSpecifyPropPages 
     * @param {Pointer<IUnknown>} pppUnknowns 
     * @param {Pointer<UInt32>} pcUnks 
     * @returns {HRESULT} 
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        result := ComCall(16, this, "ptr", ppSpecifyPropPages, "ptr", pppUnknowns, "uint*", pcUnks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPnPName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
