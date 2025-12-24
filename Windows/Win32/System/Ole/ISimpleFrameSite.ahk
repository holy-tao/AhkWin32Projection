#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides simple frame controls that act as simple containers for other nested controls.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-isimpleframesite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ISimpleFrameSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleFrameSite
     * @type {Guid}
     */
    static IID => Guid("{742b0e01-14e6-101b-914e-00aa00300cab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreMessageFilter", "PostMessageFilter"]

    /**
     * Provides a site with the opportunity to process a message that is received by a control's own window before the control itself does any processing.
     * @param {HWND} hWnd A handle of the control window receiving the message.
     * @param {Integer} msg The message received by the simple frame site.
     * @param {WPARAM} wp The <b>WPARAM</b> of the message.
     * @param {LPARAM} lp The <b>LPARAM</b> of the message.
     * @param {Pointer<LRESULT>} plResult A pointer to the variable that receives the result of the message processing.
     * @param {Pointer<Integer>} pdwCookie A pointer to the variable that will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-isimpleframesite-postmessagefilter">ISimpleFrameSite::PostMessageFilter</a> if it is called later. This parameter should only contain allocated data if this method returns S_OK so it will also receive a call to <b>PostMessageFilter</b> which can free the allocation. The caller is not in any way responsible for anything returned in this parameter.
     * @returns {HRESULT} This method can return the following values.
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
     * The simple frame site will not use the message in this filter so more processing can take place.
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
     * The site has processed the message and no further processing should occur.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The site does not do any message filtering, indicating that PostMessageFilter need not be called later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>plResult</i> or <i>pdwCookie</i> is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-isimpleframesite-premessagefilter
     */
    PreMessageFilter(hWnd, msg, wp, lp, plResult, pdwCookie) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        plResultMarshal := plResult is VarRef ? "ptr*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hWnd, "uint", msg, "ptr", wp, "ptr", lp, plResultMarshal, plResult, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * Sends the simple frame site a message that is received by a control's own window after the control has processed the message.
     * @param {HWND} hWnd A handle of the control window receiving the message.
     * @param {Integer} msg The message received by the simple frame site.
     * @param {WPARAM} wp The <b>WPARAM</b> of the message.
     * @param {LPARAM} lp The <b>LPARAM</b> of the message.
     * @param {Integer} dwCookie The value that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-isimpleframesite-premessagefilter">ISimpleFrameSite::PreMessageFilter</a> through its <i>pdwCookie</i> parameter.
     * @returns {LRESULT} A pointer to the variable that receives the result of the message processing.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-isimpleframesite-postmessagefilter
     */
    PostMessageFilter(hWnd, msg, wp, lp, dwCookie) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "uint", msg, "ptr", wp, "ptr", lp, "ptr*", &plResult := 0, "uint", dwCookie, "HRESULT")
        return plResult
    }
}
