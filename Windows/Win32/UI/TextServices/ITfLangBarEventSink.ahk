#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarEventSink interface is implemented by an application or text service and used by the language bar to supply notifications of certain events that occur in the language bar.
 * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nn-ctfutb-itflangbareventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarEventSink
     * @type {Guid}
     */
    static IID => Guid("{18a4e900-e0ae-11d2-afdd-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetFocus", "OnThreadTerminate", "OnThreadItemChange", "OnModalInput", "ShowFloating", "GetItemFloatingRect"]

    /**
     * ITfLangBarEventSink::OnSetFocus method
     * @param {Integer} dwThreadId Contains the current thread identifier. This is the same value returned from <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-onsetfocus
     */
    OnSetFocus(dwThreadId) {
        result := ComCall(3, this, "uint", dwThreadId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarEventSink::OnThreadTerminate method
     * @param {Integer} dwThreadId Not currently used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-onthreadterminate
     */
    OnThreadTerminate(dwThreadId) {
        result := ComCall(4, this, "uint", dwThreadId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarEventSink::OnThreadItemChange method
     * @param {Integer} dwThreadId Contains the current thread identifier. This is the same value returned from <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-onthreaditemchange
     */
    OnThreadItemChange(dwThreadId) {
        result := ComCall(5, this, "uint", dwThreadId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarEventSink::OnModalInput method
     * @param {Integer} dwThreadId Not currently used.
     * @param {Integer} uMsg Not currently used.
     * @param {WPARAM} wParam_ Not currently used.
     * @param {LPARAM} lParam_ Not currently used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-onmodalinput
     */
    OnModalInput(dwThreadId, uMsg, wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(6, this, "uint", dwThreadId, "uint", uMsg, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarEventSink::ShowFloating method
     * @param {Integer} dwFlags Contains the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-sft--constants">TF_SFT_*</a> values passed to <b>ITfLangBarMgr::ShowFloating</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-showfloating
     */
    ShowFloating(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarEventSink::GetItemFloatingRect method
     * @param {Integer} dwThreadId Not currently used.
     * @param {Pointer<Guid>} rguid Not currently used.
     * @returns {RECT} Not currently used.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbareventsink-getitemfloatingrect
     */
    GetItemFloatingRect(dwThreadId, rguid) {
        prc := RECT()
        result := ComCall(8, this, "uint", dwThreadId, "ptr", rguid, "ptr", prc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prc
    }
}
