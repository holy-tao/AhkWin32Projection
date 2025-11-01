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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEnabled", "Enable", "GetLogFileName", "SetLogFileName", "LogString", "LogDword", "Reset", "GetSizeParams", "SetSizeParams"]

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-isenabled
     */
    IsEnabled(pfEnabled) {
        result := ComCall(3, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-enable
     */
    Enable(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFilename 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-getlogfilename
     */
    GetLogFileName(pszFilename, nMaxChars) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(5, this, "ptr", pszFilename, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-setlogfilename
     */
    SetLogFileName(pszFilename) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(6, this, "ptr", pszFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName 
     * @param {PSTR} pszLog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-logstring
     */
    LogString(dwFlags, pszSrcName, pszLog) {
        pszSrcName := pszSrcName is String ? StrPtr(pszSrcName) : pszSrcName
        pszLog := pszLog is String ? StrPtr(pszLog) : pszLog

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName 
     * @param {PSTR} pszLogFormat 
     * @param {Integer} dwLog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-logdword
     */
    LogDword(dwFlags, pszSrcName, pszLogFormat, dwLog) {
        pszSrcName := pszSrcName is String ? StrPtr(pszSrcName) : pszSrcName
        pszLogFormat := pszLogFormat is String ? StrPtr(pszLogFormat) : pszLogFormat

        result := ComCall(8, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLogFormat, "uint", dwLog, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-reset
     */
    Reset() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxSize 
     * @param {Pointer<Integer>} pdwShrinkToSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-getsizeparams
     */
    GetSizeParams(pdwMaxSize, pdwShrinkToSize) {
        result := ComCall(10, this, "uint*", pdwMaxSize, "uint*", pdwShrinkToSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxSize 
     * @param {Integer} dwShrinkToSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdmlog/nf-wmdmlog-iwmdmlogger-setsizeparams
     */
    SetSizeParams(dwMaxSize, dwShrinkToSize) {
        result := ComCall(11, this, "uint", dwMaxSize, "uint", dwShrinkToSize, "HRESULT")
        return result
    }
}
