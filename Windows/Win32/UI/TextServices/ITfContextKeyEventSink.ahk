#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The ITfContextKeyEventSink interface is implemented by a text service to receive keyboard event notifications that occur in an input context.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontextkeyeventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfContextKeyEventSink extends IUnknown {
    /**
     * The interface identifier for ITfContextKeyEventSink
     * @type {Guid}
     */
    static IID := Guid("{0552ba5d-c835-4934-bf50-846aaa67432f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfContextKeyEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnKeyDown     : IntPtr
        OnKeyUp       : IntPtr
        OnTestKeyDown : IntPtr
        OnTestKeyUp   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfContextKeyEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfContextKeyEventSink::OnKeyDown method
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeydown
     */
    OnKeyDown(_wParam, _lParam) {
        result := ComCall(3, this, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnKeyUp method
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeyup
     */
    OnKeyUp(_wParam, _lParam) {
        result := ComCall(4, this, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyDown method
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(_wParam, _lParam) {
        result := ComCall(5, this, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyUp method
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event would is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(_wParam, _lParam) {
        result := ComCall(6, this, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    Query(iid) {
        if (ITfContextKeyEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnKeyDown := CallbackCreate(GetMethod(implObj, "OnKeyDown"), flags, 4)
        this.vtbl.OnKeyUp := CallbackCreate(GetMethod(implObj, "OnKeyUp"), flags, 4)
        this.vtbl.OnTestKeyDown := CallbackCreate(GetMethod(implObj, "OnTestKeyDown"), flags, 4)
        this.vtbl.OnTestKeyUp := CallbackCreate(GetMethod(implObj, "OnTestKeyUp"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnKeyDown)
        CallbackFree(this.vtbl.OnKeyUp)
        CallbackFree(this.vtbl.OnTestKeyDown)
        CallbackFree(this.vtbl.OnTestKeyUp)
    }
}
