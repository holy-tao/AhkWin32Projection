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
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    SetPlayMode(Mode) {
        result := ComCall(23, this, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMode 
     * @returns {HRESULT} 
     */
    GetPlayMode(pMode) {
        result := ComCall(24, this, "int*", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPercent 
     * @param {Pointer<UInt64>} pcnsBuffering 
     * @returns {HRESULT} 
     */
    GetBufferProgress(pdwPercent, pcnsBuffering) {
        result := ComCall(25, this, "uint*", pdwPercent, "uint*", pcnsBuffering, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPercent 
     * @param {Pointer<UInt64>} pqwBytesDownloaded 
     * @param {Pointer<UInt64>} pcnsDownload 
     * @returns {HRESULT} 
     */
    GetDownloadProgress(pdwPercent, pqwBytesDownloaded, pcnsDownload) {
        result := ComCall(26, this, "uint*", pdwPercent, "uint*", pqwBytesDownloaded, "uint*", pcnsDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPercent 
     * @returns {HRESULT} 
     */
    GetSaveAsProgress(pdwPercent) {
        result := ComCall(27, this, "uint*", pdwPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     */
    SaveFileAs(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(28, this, "ptr", pwszFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<UInt32>} pcchProtocol 
     * @returns {HRESULT} 
     */
    GetProtocolName(pwszProtocol, pcchProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(29, this, "ptr", pwszProtocol, "uint*", pcchProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wMarkerIndex 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    StartAtMarker(wMarkerIndex, cnsDuration, fRate, pvContext) {
        result := ComCall(30, this, "ushort", wMarkerIndex, "uint", cnsDuration, "float", fRate, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(31, this, "uint", dwOutputNum, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(32, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsStart 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @returns {HRESULT} 
     */
    Preroll(cnsStart, cnsDuration, fRate) {
        result := ComCall(33, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLogClientID 
     * @returns {HRESULT} 
     */
    SetLogClientID(fLogClientID) {
        result := ComCall(34, this, "int", fLogClientID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLogClientID 
     * @returns {HRESULT} 
     */
    GetLogClientID(pfLogClientID) {
        result := ComCall(35, this, "ptr", pfLogClientID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopBuffering() {
        result := ComCall(36, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<IWMReaderCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OpenStream(pStream, pCallback, pvContext) {
        result := ComCall(37, this, "ptr", pStream, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
