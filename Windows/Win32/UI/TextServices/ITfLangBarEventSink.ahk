#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The ITfLangBarEventSink interface is implemented by an application or text service and used by the language bar to supply notifications of certain events that occur in the language bar.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbareventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarEventSink extends IUnknown {
    /**
     * The interface identifier for ITfLangBarEventSink
     * @type {Guid}
     */
    static IID := Guid("{18a4e900-e0ae-11d2-afdd-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSetFocus          : IntPtr
        OnThreadTerminate   : IntPtr
        OnThreadItemChange  : IntPtr
        OnModalInput        : IntPtr
        ShowFloating        : IntPtr
        GetItemFloatingRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarEventSink::OnSetFocus method
     * @param {Integer} dwThreadId Contains the current thread identifier. This is the same value returned from <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onsetfocus
     */
    OnSetFocus(dwThreadId) {
        result := ComCall(3, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * ITfLangBarEventSink::OnThreadTerminate method
     * @param {Integer} dwThreadId Not currently used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onthreadterminate
     */
    OnThreadTerminate(dwThreadId) {
        result := ComCall(4, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * ITfLangBarEventSink::OnThreadItemChange method
     * @param {Integer} dwThreadId Contains the current thread identifier. This is the same value returned from <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onthreaditemchange
     */
    OnThreadItemChange(dwThreadId) {
        result := ComCall(5, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * ITfLangBarEventSink::OnModalInput method
     * @param {Integer} dwThreadId Not currently used.
     * @param {Integer} uMsg Not currently used.
     * @param {WPARAM} _wParam Not currently used.
     * @param {LPARAM} _lParam Not currently used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onmodalinput
     */
    OnModalInput(dwThreadId, uMsg, _wParam, _lParam) {
        result := ComCall(6, this, "uint", dwThreadId, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * ITfLangBarEventSink::ShowFloating method
     * @param {Integer} dwFlags Contains the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-sft--constants">TF_SFT_*</a> values passed to <b>ITfLangBarMgr::ShowFloating</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-showfloating
     */
    ShowFloating(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfLangBarEventSink::GetItemFloatingRect method
     * @param {Integer} dwThreadId Not currently used.
     * @param {Pointer<Guid>} rguid Not currently used.
     * @returns {RECT} Not currently used.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-getitemfloatingrect
     */
    GetItemFloatingRect(dwThreadId, rguid) {
        prc := RECT()
        result := ComCall(8, this, "uint", dwThreadId, Guid.Ptr, rguid, RECT.Ptr, prc, "HRESULT")
        return prc
    }

    Query(iid) {
        if (ITfLangBarEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetFocus := CallbackCreate(GetMethod(implObj, "OnSetFocus"), flags, 2)
        this.vtbl.OnThreadTerminate := CallbackCreate(GetMethod(implObj, "OnThreadTerminate"), flags, 2)
        this.vtbl.OnThreadItemChange := CallbackCreate(GetMethod(implObj, "OnThreadItemChange"), flags, 2)
        this.vtbl.OnModalInput := CallbackCreate(GetMethod(implObj, "OnModalInput"), flags, 5)
        this.vtbl.ShowFloating := CallbackCreate(GetMethod(implObj, "ShowFloating"), flags, 2)
        this.vtbl.GetItemFloatingRect := CallbackCreate(GetMethod(implObj, "GetItemFloatingRect"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetFocus)
        CallbackFree(this.vtbl.OnThreadTerminate)
        CallbackFree(this.vtbl.OnThreadItemChange)
        CallbackFree(this.vtbl.OnModalInput)
        CallbackFree(this.vtbl.ShowFloating)
        CallbackFree(this.vtbl.GetItemFloatingRect)
    }
}
