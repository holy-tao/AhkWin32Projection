#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that determines whether a window that is launched by another window should be displayed or blocked, allowing control of pop-up windows.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>INewWindowManager</b> when your application hosts a <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752040(v=vs.85)">WebBrowser</a> control and you want to include pop-up management functionality.
 * 
 * When you implement <b>INewWindowManager</b>, you can override some or all of the Windows Internet Explorer pop-up blocking logic. To use the default Internet Explorer pop-up blocking logic, implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">INewWindowManager::EvaluateNewWindow</a> to return E_FAIL. This instructs the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752040(v=vs.85)">WebBrowser</a> control to use the default Internet Explorer implementation. Alternately, the application hosting the WebBrowser control can call <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms537168(v=vs.85)">CoInternetSetFeatureEnabled</a> with the <b>FEATURE_WEBOC_POPUPMANAGEMENT</b> flag for the same result.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inewwindowmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INewWindowManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INewWindowManager
     * @type {Guid}
     */
    static IID => Guid("{d2bc4c84-3f72-4a52-a604-7bcbf3982cbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateNewWindow"]

    /**
     * Accepts data about a new window that is attempting to display and determines whether that window should be allowed to open based on the user's preferences.
     * @param {PWSTR} pszUrl Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the URL of the content that will be displayed in the new window.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the name of the new window. This parameter can be <b>NULL</b>.
     * @param {PWSTR} pszUrlContext Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the URL that has issued the command to open the new window.
     * @param {PWSTR} pszFeatures Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the feature string for the new window. This value can be <b>NULL</b>.
     * @param {BOOL} fReplace Type: <b>BOOL</b>
     * 
     * A boolean value used when the new content specified in <i>pszUrl</i> is loaded into the existing window instead of creating a new one. <b>TRUE</b> if the new document should replace the current document in the history list; <b>FALSE</b> if the new document should be given a new entry.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * A flag or flags from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF</a> enumeration that provide situational information about the call to open the new window. This value can be 0 if no flags are needed.
     * @param {Integer} dwUserActionTime Type: <b>DWORD</b>
     * 
     * The tick count when the last user action occurred. To find out how long ago the action occurred, call <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-gettickcount">GetTickCount</a> and compare the result with the value in this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns standard error codes, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allow display of the window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Block display of the window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When you implement <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inewwindowmanager">INewWindowManager</a> for a hosted <a href="/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752040(v=vs.85)">WebBrowser</a> control, this value instructs the WebBrowser control to use the default implementation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow
     */
    EvaluateNewWindow(pszUrl, pszName, pszUrlContext, pszFeatures, fReplace, dwFlags, dwUserActionTime) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszUrlContext := pszUrlContext is String ? StrPtr(pszUrlContext) : pszUrlContext
        pszFeatures := pszFeatures is String ? StrPtr(pszFeatures) : pszFeatures

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszName, "ptr", pszUrlContext, "ptr", pszFeatures, "int", fReplace, "uint", dwFlags, "uint", dwUserActionTime, "HRESULT")
        return result
    }
}
