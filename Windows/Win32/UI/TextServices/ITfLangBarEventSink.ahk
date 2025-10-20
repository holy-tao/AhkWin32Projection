#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarEventSink interface is implemented by an application or text service and used by the language bar to supply notifications of certain events that occur in the language bar.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbareventsink
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
     * 
     * @param {Integer} dwThreadId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onsetfocus
     */
    OnSetFocus(dwThreadId) {
        result := ComCall(3, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onthreadterminate
     */
    OnThreadTerminate(dwThreadId) {
        result := ComCall(4, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onthreaditemchange
     */
    OnThreadItemChange(dwThreadId) {
        result := ComCall(5, this, "uint", dwThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-onmodalinput
     */
    OnModalInput(dwThreadId, uMsg, wParam, lParam) {
        result := ComCall(6, this, "uint", dwThreadId, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-showfloating
     */
    ShowFloating(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbareventsink-getitemfloatingrect
     */
    GetItemFloatingRect(dwThreadId, rguid, prc) {
        result := ComCall(8, this, "uint", dwThreadId, "ptr", rguid, "ptr", prc, "HRESULT")
        return result
    }
}
