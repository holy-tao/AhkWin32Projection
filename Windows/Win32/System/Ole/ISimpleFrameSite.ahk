#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Provides simple frame controls that act as simple containers for other nested controls.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-isimpleframesite
 * @namespace Windows.Win32.System.Ole
 */
export default struct ISimpleFrameSite extends IUnknown {
    /**
     * The interface identifier for ISimpleFrameSite
     * @type {Guid}
     */
    static IID := Guid("{742b0e01-14e6-101b-914e-00aa00300cab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimpleFrameSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PreMessageFilter  : IntPtr
        PostMessageFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimpleFrameSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a site with the opportunity to process a message that is received by a control's own window before the control itself does any processing.
     * @remarks
     * Successful return values indicate whether the site wishes to allow further processing. S_OK indicates further processing, whereas S_FALSE means do not process further. S_OK also indicates that the control must later call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-isimpleframesite-postmessagefilter">PostMessageFilter</a>.
     * @param {HWND} _hWnd A handle of the control window receiving the message.
     * @param {Integer} _msg The message received by the simple frame site.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-isimpleframesite-premessagefilter
     */
    PreMessageFilter(_hWnd, _msg, wp, lp, plResult, pdwCookie) {
        plResultMarshal := plResult is VarRef ? "ptr*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, HWND, _hWnd, "uint", _msg, WPARAM, wp, LPARAM, lp, plResultMarshal, plResult, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * Sends the simple frame site a message that is received by a control's own window after the control has processed the message.
     * @param {HWND} _hWnd A handle of the control window receiving the message.
     * @param {Integer} _msg The message received by the simple frame site.
     * @param {WPARAM} wp The <b>WPARAM</b> of the message.
     * @param {LPARAM} lp The <b>LPARAM</b> of the message.
     * @param {Integer} dwCookie The value that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-isimpleframesite-premessagefilter">ISimpleFrameSite::PreMessageFilter</a> through its <i>pdwCookie</i> parameter.
     * @returns {LRESULT} A pointer to the variable that receives the result of the message processing.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-isimpleframesite-postmessagefilter
     */
    PostMessageFilter(_hWnd, _msg, wp, lp, dwCookie) {
        result := ComCall(4, this, HWND, _hWnd, "uint", _msg, WPARAM, wp, LPARAM, lp, LRESULT.Ptr, &plResult := 0, "uint", dwCookie, "HRESULT")
        return plResult
    }

    Query(iid) {
        if (ISimpleFrameSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PreMessageFilter := CallbackCreate(GetMethod(implObj, "PreMessageFilter"), flags, 7)
        this.vtbl.PostMessageFilter := CallbackCreate(GetMethod(implObj, "PostMessageFilter"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PreMessageFilter)
        CallbackFree(this.vtbl.PostMessageFilter)
    }
}
