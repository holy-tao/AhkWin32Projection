#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMDevice.ahk

/**
 * The IWMDMDevice2 interface extends IWMDMDevice by making it possible to get the video formats supported by a device, find storage from its name, and use property pages.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice2 extends IWMDMDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice2
     * @type {Guid}
     */
    static IID => Guid("{e34f3d37-9d67-4fc1-9252-62d28b2f8b55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorage", "GetFormatSupport2", "GetSpecifyPropertyPages", "GetCanonicalName"]

    /**
     * 
     * @param {PWSTR} pszStorageName 
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getstorage
     */
    GetStorage(pszStorageName, ppStorage) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr*", ppStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppAudioFormatEx 
     * @param {Pointer<Integer>} pnAudioFormatCount 
     * @param {Pointer<Pointer<VIDEOINFOHEADER>>} ppVideoFormatEx 
     * @param {Pointer<Integer>} pnVideoFormatCount 
     * @param {Pointer<Pointer<WMFILECAPABILITIES>>} ppFileType 
     * @param {Pointer<Integer>} pnFileTypeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getformatsupport2
     */
    GetFormatSupport2(dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount) {
        pnAudioFormatCountMarshal := pnAudioFormatCount is VarRef ? "uint*" : "ptr"
        pnVideoFormatCountMarshal := pnVideoFormatCount is VarRef ? "uint*" : "ptr"
        pnFileTypeCountMarshal := pnFileTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwFlags, "ptr*", ppAudioFormatEx, pnAudioFormatCountMarshal, pnAudioFormatCount, "ptr*", ppVideoFormatEx, pnVideoFormatCountMarshal, pnVideoFormatCount, "ptr*", ppFileType, pnFileTypeCountMarshal, pnFileTypeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpecifyPropertyPages>} ppSpecifyPropPages 
     * @param {Pointer<Pointer<IUnknown>>} pppUnknowns 
     * @param {Pointer<Integer>} pcUnks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getspecifypropertypages
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        pcUnksMarshal := pcUnks is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", ppSpecifyPropPages, "ptr*", pppUnknowns, pcUnksMarshal, pcUnks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPnPName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getcanonicalname
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "HRESULT")
        return result
    }
}
