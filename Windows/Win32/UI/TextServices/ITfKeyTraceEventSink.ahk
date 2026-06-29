#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The ITfKeyTraceEventSink interface is implemented by an application or text service to receive key stroke event notifications before the event is processed by the target.
 * @remarks
 * The difference between <b>ITfKeyTraceEventSink</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfkeyeventsink">ITfKeyEventSink</a> events is that <b>ITfKeyTraceEventSink</b> events occur before any filtering or processing of the key event occurs. The <b>ITfKeyTraceEventSink</b> events also occur before the target application can process the key event.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfkeytraceeventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfKeyTraceEventSink extends IUnknown {
    /**
     * The interface identifier for ITfKeyTraceEventSink
     * @type {Guid}
     */
    static IID := Guid("{1cd4c13b-1c36-4191-a70a-7f3e611f367d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfKeyTraceEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnKeyTraceDown : IntPtr
        OnKeyTraceUp   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfKeyTraceEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfKeyTraceEventSink::OnKeyTraceDown method
     * @param {WPARAM} _wParam The WPARAM of the key event. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam The LPARAM of the key event. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeytraceeventsink-onkeytracedown
     */
    OnKeyTraceDown(_wParam, _lParam) {
        result := ComCall(3, this, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * ITfKeyTraceEventSink::OnKeyTraceUp method
     * @param {WPARAM} _wParam The WPARAM of the key event. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} _lParam The LPARAM of the key event. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeytraceeventsink-onkeytraceup
     */
    OnKeyTraceUp(_wParam, _lParam) {
        result := ComCall(4, this, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfKeyTraceEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnKeyTraceDown := CallbackCreate(GetMethod(implObj, "OnKeyTraceDown"), flags, 3)
        this.vtbl.OnKeyTraceUp := CallbackCreate(GetMethod(implObj, "OnKeyTraceUp"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnKeyTraceDown)
        CallbackFree(this.vtbl.OnKeyTraceUp)
    }
}
