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
     * The IsEnabled method determines whether logging is enabled.
     * @returns {BOOL} Pointer to a flag that is true on output if logging is enabled.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-isenabled
     */
    IsEnabled() {
        result := ComCall(3, this, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The Enable method enables or disables logging. Logging is enabled by default.
     * @param {BOOL} fEnable Flag that enables logging if it is true and disables logging if it is <b>false</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-enable
     */
    Enable(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The GetLogFileName method returns the full path to the current log file.
     * @param {PSTR} pszFilename Pointer to a buffer to receive the log file name.
     * @param {Integer} nMaxChars Specifies the size of the <i>pszFilename</i> buffer. This is the maximum number of characters that can be placed in the buffer, including the terminating <b>NULL</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-getlogfilename
     */
    GetLogFileName(pszFilename, nMaxChars) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(5, this, "ptr", pszFilename, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The SetLogFileName method sets the full path to the current log file. All subsequent log entries will be placed in this file.
     * @param {PSTR} pszFilename Pointer to a string that is the full path to the new log file. Note that this is not a wide-character string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-setlogfilename
     */
    SetLogFileName(pszFilename) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename

        result := ComCall(6, this, "ptr", pszFilename, "HRESULT")
        return result
    }

    /**
     * The LogString method logs a string to the current log file. A carriage return and line feed are added to each log entry.
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName Pointer to a string containing the name of the module that is making the log entry. This parameter can be <b>NULL</b>.
     * @param {PSTR} pszLog Pointer to a string to be copied to the log. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-logstring
     */
    LogString(dwFlags, pszSrcName, pszLog) {
        pszSrcName := pszSrcName is String ? StrPtr(pszSrcName) : pszSrcName
        pszLog := pszLog is String ? StrPtr(pszLog) : pszLog

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLog, "HRESULT")
        return result
    }

    /**
     * The LogDword method logs a DWORD value to the current log file. A carriage return and line feed are added to each log entry.
     * @param {Integer} dwFlags 
     * @param {PSTR} pszSrcName Optional pointer to a string containing the name of the module that is making the log entry.
     * @param {PSTR} pszLogFormat Pointer to a string that specifies the format of the log string. This string is of the same form as the format string for the <b>printf</b> function.
     * @param {Integer} dwLog <b>DWORD</b> value to log.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-logdword
     */
    LogDword(dwFlags, pszSrcName, pszLogFormat, dwLog) {
        pszSrcName := pszSrcName is String ? StrPtr(pszSrcName) : pszSrcName
        pszLogFormat := pszLogFormat is String ? StrPtr(pszLogFormat) : pszLogFormat

        result := ComCall(8, this, "uint", dwFlags, "ptr", pszSrcName, "ptr", pszLogFormat, "uint", dwLog, "HRESULT")
        return result
    }

    /**
     * The Reset method deletes the contents of the current log file.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-reset
     */
    Reset() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The GetSizeParams method retrieves the current size parameters of the current log file.
     * @param {Pointer<Integer>} pdwMaxSize Pointer to a buffer that receives the approximate maximum size of the log file. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwShrinkToSize Pointer to a buffer that receives the approximate size to which the log file will be reduced after it reaches the maximum size. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-getsizeparams
     */
    GetSizeParams(pdwMaxSize, pdwShrinkToSize) {
        pdwMaxSizeMarshal := pdwMaxSize is VarRef ? "uint*" : "ptr"
        pdwShrinkToSizeMarshal := pdwShrinkToSize is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwMaxSizeMarshal, pdwMaxSize, pdwShrinkToSizeMarshal, pdwShrinkToSize, "HRESULT")
        return result
    }

    /**
     * The SetSizeParams method sets the current size parameters for the current log file.
     * @param {Integer} dwMaxSize The approximate maximum size of the log file. The size of the log file is checked before each log entry is made. Therefore, the log file can grow bigger than the maximum size until the next log entry is made.
     * @param {Integer} dwShrinkToSize The approximate file size to which the log file should be reduced when the maximum log file size is reached. The log file is generally shrunk to a little smaller than this value so that the file is not split in the middle of a log entry.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * 
     * The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * @see https://docs.microsoft.com/windows/win32/api//wmdmlog/nf-wmdmlog-iwmdmlogger-setsizeparams
     */
    SetSizeParams(dwMaxSize, dwShrinkToSize) {
        result := ComCall(11, this, "uint", dwMaxSize, "uint", dwShrinkToSize, "HRESULT")
        return result
    }
}
