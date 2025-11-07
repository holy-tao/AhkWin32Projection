#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPDevice.ahk

/**
 * The IMDSPDevice2 interface extends IMDSPDevice by getting extended formats, getting Plug and Play (PnP) device names, enabling the use of property pages, and making it possible to get a pointer to a storage medium from its name.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice2 extends IMDSPDevice{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorage", "GetFormatSupport2", "GetSpecifyPropertyPages", "GetCanonicalName"]

    /**
     * 
     * @param {PWSTR} pszStorageName 
     * @returns {IMDSPStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice2-getformatsupport2
     */
    GetFormatSupport2(dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount) {
        ppAudioFormatExMarshal := ppAudioFormatEx is VarRef ? "ptr*" : "ptr"
        pnAudioFormatCountMarshal := pnAudioFormatCount is VarRef ? "uint*" : "ptr"
        ppVideoFormatExMarshal := ppVideoFormatEx is VarRef ? "ptr*" : "ptr"
        pnVideoFormatCountMarshal := pnVideoFormatCount is VarRef ? "uint*" : "ptr"
        ppFileTypeMarshal := ppFileType is VarRef ? "ptr*" : "ptr"
        pnFileTypeCountMarshal := pnFileTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwFlags, ppAudioFormatExMarshal, ppAudioFormatEx, pnAudioFormatCountMarshal, pnAudioFormatCount, ppVideoFormatExMarshal, ppVideoFormatEx, pnVideoFormatCountMarshal, pnVideoFormatCount, ppFileTypeMarshal, ppFileType, pnFileTypeCountMarshal, pnFileTypeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpecifyPropertyPages>} ppSpecifyPropPages 
     * @param {Pointer<Pointer<IUnknown>>} pppUnknowns 
     * @param {Pointer<Integer>} pcUnks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice2-getspecifypropertypages
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        pppUnknownsMarshal := pppUnknowns is VarRef ? "ptr*" : "ptr"
        pcUnksMarshal := pcUnks is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", ppSpecifyPropPages, pppUnknownsMarshal, pppUnknowns, pcUnksMarshal, pcUnks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPnPName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice2-getcanonicalname
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "HRESULT")
        return result
    }
}
