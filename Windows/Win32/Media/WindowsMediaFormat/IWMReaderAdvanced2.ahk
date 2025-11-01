#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced.ahk

/**
 * The IWMReaderAdvanced2 interface provides additional advanced methods for a reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced2 extends IWMReaderAdvanced{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced2
     * @type {Guid}
     */
    static IID => Guid("{ae14a945-b90c-4d0d-9127-80d665f7d73e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPlayMode", "GetPlayMode", "GetBufferProgress", "GetDownloadProgress", "GetSaveAsProgress", "SaveFileAs", "GetProtocolName", "StartAtMarker", "GetOutputSetting", "SetOutputSetting", "Preroll", "SetLogClientID", "GetLogClientID", "StopBuffering", "OpenStream"]

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setplaymode
     */
    SetPlayMode(Mode) {
        result := ComCall(23, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getplaymode
     */
    GetPlayMode(pMode) {
        result := ComCall(24, this, "int*", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPercent 
     * @param {Pointer<Integer>} pcnsBuffering 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getbufferprogress
     */
    GetBufferProgress(pdwPercent, pcnsBuffering) {
        result := ComCall(25, this, "uint*", pdwPercent, "uint*", pcnsBuffering, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPercent 
     * @param {Pointer<Integer>} pqwBytesDownloaded 
     * @param {Pointer<Integer>} pcnsDownload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getdownloadprogress
     */
    GetDownloadProgress(pdwPercent, pqwBytesDownloaded, pcnsDownload) {
        result := ComCall(26, this, "uint*", pdwPercent, "uint*", pqwBytesDownloaded, "uint*", pcnsDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getsaveasprogress
     */
    GetSaveAsProgress(pdwPercent) {
        result := ComCall(27, this, "uint*", pdwPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-savefileas
     */
    SaveFileAs(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(28, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<Integer>} pcchProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getprotocolname
     */
    GetProtocolName(pwszProtocol, pcchProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(29, this, "ptr", pwszProtocol, "uint*", pcchProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wMarkerIndex 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-startatmarker
     */
    StartAtMarker(wMarkerIndex, cnsDuration, fRate, pvContext) {
        result := ComCall(30, this, "ushort", wMarkerIndex, "uint", cnsDuration, "float", fRate, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getoutputsetting
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(31, this, "uint", dwOutputNum, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setoutputsetting
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(32, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsStart 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-preroll
     */
    Preroll(cnsStart, cnsDuration, fRate) {
        result := ComCall(33, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLogClientID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setlogclientid
     */
    SetLogClientID(fLogClientID) {
        result := ComCall(34, this, "int", fLogClientID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLogClientID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getlogclientid
     */
    GetLogClientID(pfLogClientID) {
        result := ComCall(35, this, "ptr", pfLogClientID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-stopbuffering
     */
    StopBuffering() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {IWMReaderCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-openstream
     */
    OpenStream(pStream, pCallback, pvContext) {
        result := ComCall(37, this, "ptr", pStream, "ptr", pCallback, "ptr", pvContext, "HRESULT")
        return result
    }
}
