#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.TextServices
 */

;@region Functions
/**
 * 
 * @param {Integer} dwFlags 
 * @param {HANDLE} hEventForServiceStop 
 * @returns {BOOL} 
 */
export DoMsCtfMonitor(dwFlags, hEventForServiceStop) {
    result := DllCall("MsCtfMonitor.dll\DoMsCtfMonitor", "uint", dwFlags, HANDLE, hEventForServiceStop, BOOL)
    return result
}

/**
 * The InitLocalMsCtfMonitor function initializes TextServicesFramework on the current desktop and prepares the floating language bar, if necessary. This function must be called on the app's desktop.
 * @remarks
 * If this function was successful, <a href="https://docs.microsoft.com/windows/desktop/api/msctfmonitorapi/nf-msctfmonitorapi-uninitlocalmsctfmonitor">UninitLocalMsCtfMonitor</a> needs to be called before the caller thread is terminated or the desktop is switched.
 * @param {Integer} dwFlags This is a combination of the following flags:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILMCM_CHECKLAYOUTANDTIPENABLED"></a><a id="ilmcm_checklayoutandtipenabled"></a><dl>
 * <dt><b>ILMCM_CHECKLAYOUTANDTIPENABLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <b>InitLocalMsCtfMonitor</b> forcefully checks the available keyboard layout or text service. If there is no secondary keyboard layout or text services, it does not initialize TextServicesFramework on the desktop.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILMCM_LANGUAGEBAROFF"></a><a id="ilmcm_languagebaroff"></a><dl>
 * <dt><b>ILMCM_LANGUAGEBAROFF</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <b>Starting with Windows 8:</b> A local language bar is not started for the current desktop.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>S_OK</td>
 * <td>The function was successful.</td>
 * </tr>
 * <tr>
 * <td>E_FAIL</td>
 * <td>An unspecified error occurred.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msctfmonitorapi/nf-msctfmonitorapi-initlocalmsctfmonitor
 * @since windows6.0.6000
 */
export InitLocalMsCtfMonitor(dwFlags) {
    result := DllCall("MsCtfMonitor.dll\InitLocalMsCtfMonitor", "uint", dwFlags, "HRESULT")
    return result
}

/**
 * The UninitLocalMsCtfMonitor function uninitializes TextServicesFramework on the current desktop.
 * @returns {HRESULT} <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>S_OK</td>
 * <td>The function was successful.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msctfmonitorapi/nf-msctfmonitorapi-uninitlocalmsctfmonitor
 * @since windows6.0.6000
 */
export UninitLocalMsCtfMonitor() {
    result := DllCall("MsCtfMonitor.dll\UninitLocalMsCtfMonitor", "HRESULT")
    return result
}

;@endregion Functions
