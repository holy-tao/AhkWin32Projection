#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The ITfKeyEventSink interface is implemented by a text service to receive keyboard and focus event notifications. To install this event sink, call ITfKeystrokeMgr::AdviseKeyEventSink.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfkeyeventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfKeyEventSink extends IUnknown {
    /**
     * The interface identifier for ITfKeyEventSink
     * @type {Guid}
     */
    static IID := Guid("{aa80e7f5-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfKeyEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSetFocus     : IntPtr
        OnTestKeyDown  : IntPtr
        OnTestKeyUp    : IntPtr
        OnKeyDown      : IntPtr
        OnKeyUp        : IntPtr
        OnPreservedKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfKeyEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfKeyEventSink::OnSetFocus method
     * @param {BOOL} fForeground If <b>TRUE</b>, the test service receives the focus. Otherwise the text service loses the focus.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onsetfocus
     */
    OnSetFocus(fForeground) {
        result := ComCall(3, this, BOOL, fForeground, "HRESULT")
        return result
    }

    /**
     * ITfKeyEventSink::OnTestKeyDown method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event would be handled. If this value receives <b>TRUE</b>, the key event would be handled. If this value is <b>FALSE</b>, the key event would not be handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(pic, _wParam, _lParam) {
        result := ComCall(4, this, "ptr", pic, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnTestKeyUp method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event would be handled. If this value receives <b>TRUE</b>, the key event would be handled. If this value receives <b>FALSE</b>, the key event would not be handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(pic, _wParam, _lParam) {
        result := ComCall(5, this, "ptr", pic, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnKeyDown method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled. If this value is <b>FALSE</b>, the key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeydown
     */
    OnKeyDown(pic, _wParam, _lParam) {
        result := ComCall(6, this, "ptr", pic, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnKeyUp method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled. If this value receives <b>FALSE</b>, the key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeyup
     */
    OnKeyUp(pic, _wParam, _lParam) {
        result := ComCall(7, this, "ptr", pic, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnPreservedKey method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the preserved key event was handled. If this value receives <b>TRUE</b>, the preserved key event was handled. If this value receives <b>FALSE</b>, the preserved key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onpreservedkey
     */
    OnPreservedKey(pic, rguid) {
        result := ComCall(8, this, "ptr", pic, Guid.Ptr, rguid, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    Query(iid) {
        if (ITfKeyEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetFocus := CallbackCreate(GetMethod(implObj, "OnSetFocus"), flags, 2)
        this.vtbl.OnTestKeyDown := CallbackCreate(GetMethod(implObj, "OnTestKeyDown"), flags, 5)
        this.vtbl.OnTestKeyUp := CallbackCreate(GetMethod(implObj, "OnTestKeyUp"), flags, 5)
        this.vtbl.OnKeyDown := CallbackCreate(GetMethod(implObj, "OnKeyDown"), flags, 5)
        this.vtbl.OnKeyUp := CallbackCreate(GetMethod(implObj, "OnKeyUp"), flags, 5)
        this.vtbl.OnPreservedKey := CallbackCreate(GetMethod(implObj, "OnPreservedKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetFocus)
        CallbackFree(this.vtbl.OnTestKeyDown)
        CallbackFree(this.vtbl.OnTestKeyUp)
        CallbackFree(this.vtbl.OnKeyDown)
        CallbackFree(this.vtbl.OnKeyUp)
        CallbackFree(this.vtbl.OnPreservedKey)
    }
}
