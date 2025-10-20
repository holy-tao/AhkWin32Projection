#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMLogger interface is used by Windows Media Device Manager applications and service providers to log entries in a common log file.
 * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nn-wmdmlog-iwmdmlogger
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMLogger extends IUnknown{
    /**
     * The interface identifier for IWMDMLogger
     * @type {Guid}
     */
    static IID => Guid("{110a3200-5a79-11d3-8d78-444553540000}")

    /**
     * The class identifier for WMDMLogger
     * @type {Guid}
     */
    static CLSID => Guid("{110a3202-5a79-11d3-8d78-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    IsEnabled(pfEnabled) {
        result := ComCall(3, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Enable(fEnable) {
        result := ComCall(4, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFilename 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetLogFileName(pszFilename, nMaxChars) {
        result := ComCall(5, this, "ptr", pszFilename, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFilename 
     * @returns {HRESULT} 
     */
    SetLogFileName(pszFilename) {
        result := ComCall(6, this, "ptr", pszFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName 
     * @param {PSTR} pszLog 
     * @returns {HRESULT} 
     */
    LogString(dwFlags, pszSrcName, pszLog) {
        result := ComCall(7, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName 
     * @param {PSTR} pszLogFormat 
     * @param {Integer} dwLog 
     * @returns {HRESULT} 
     */
    LogDword(dwFlags, pszSrcName, pszLogFormat, dwLog) {
        result := ComCall(8, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLogFormat, "uint", dwLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxSize 
     * @param {Pointer<UInt32>} pdwShrinkToSize 
     * @returns {HRESULT} 
     */
    GetSizeParams(pdwMaxSize, pdwShrinkToSize) {
        result := ComCall(10, this, "uint*", pdwMaxSize, "uint*", pdwShrinkToSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxSize 
     * @param {Integer} dwShrinkToSize 
     * @returns {HRESULT} 
     */
    SetSizeParams(dwMaxSize, dwShrinkToSize) {
        result := ComCall(11, this, "uint", dwMaxSize, "uint", dwShrinkToSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
