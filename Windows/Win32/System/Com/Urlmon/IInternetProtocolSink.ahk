#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolSink
     * @type {Guid}
     */
    static IID => Guid("{79eac9e5-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Switch", "ReportProgress", "ReportData", "ReportResult"]

    /**
     * Makes the specified desktop visible and activates it. This enables the desktop to receive input from the user.
     * @remarks
     * The 
     * <b>SwitchDesktop</b> function fails if the desktop belongs to an invisible window station. 
     * <b>SwitchDesktop</b> also fails when called from a process that is associated with a secured desktop such as the WinLogon and ScreenSaver desktops. Processes that are associated with a secured desktop include custom UserInit processes. Such calls typically fail with an "access denied" error.
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. However, 
     * <b>SwitchDesktop</b> only sets the last error for the following cases:
     * 
     * <ul>
     * <li>When the desktop belongs to an invisible window station</li>
     * <li>When <i>hDesktop</i> is an invalid handle, refers to a destroyed desktop, or belongs to a different session than that of the calling process</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-switchdesktop
     */
    Switch(pProtocolData) {
        result := ComCall(3, this, "ptr", pProtocolData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    ReportProgress(ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(4, this, "uint", ulStatusCode, "ptr", szStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @returns {HRESULT} 
     */
    ReportData(grfBSCF, ulProgress, ulProgressMax) {
        result := ComCall(5, this, "uint", grfBSCF, "uint", ulProgress, "uint", ulProgressMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} dwError 
     * @param {PWSTR} szResult 
     * @returns {HRESULT} 
     */
    ReportResult(hrResult, dwError, szResult) {
        szResult := szResult is String ? StrPtr(szResult) : szResult

        result := ComCall(6, this, "int", hrResult, "uint", dwError, "ptr", szResult, "HRESULT")
        return result
    }
}
