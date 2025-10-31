#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfKeystrokeMgr interface is implemented by the TSF manager and used by applications and text services to interact with the keyboard manager.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfkeystrokemgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfKeystrokeMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfKeystrokeMgr
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f0-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseKeyEventSink", "UnadviseKeyEventSink", "GetForeground", "TestKeyDown", "TestKeyUp", "KeyDown", "KeyUp", "GetPreservedKey", "IsPreservedKey", "PreserveKey", "UnpreserveKey", "SetPreservedKeyDescription", "GetPreservedKeyDescription", "SimulatePreservedKey"]

    /**
     * 
     * @param {Integer} tid 
     * @param {ITfKeyEventSink} pSink 
     * @param {BOOL} fForeground 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-advisekeyeventsink
     */
    AdviseKeyEventSink(tid, pSink, fForeground) {
        result := ComCall(3, this, "uint", tid, "ptr", pSink, "int", fForeground, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-unadvisekeyeventsink
     */
    UnadviseKeyEventSink(tid) {
        result := ComCall(4, this, "uint", tid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-getforeground
     */
    GetForeground(pclsid) {
        result := ComCall(5, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-testkeydown
     */
    TestKeyDown(wParam, lParam, pfEaten) {
        result := ComCall(6, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-testkeyup
     */
    TestKeyUp(wParam, lParam, pfEaten) {
        result := ComCall(7, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-keydown
     */
    KeyDown(wParam, lParam, pfEaten) {
        result := ComCall(8, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-keyup
     */
    KeyUp(wParam, lParam, pfEaten) {
        result := ComCall(9, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-getpreservedkey
     */
    GetPreservedKey(pic, pprekey, pguid) {
        result := ComCall(10, this, "ptr", pic, "ptr", pprekey, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @param {Pointer<BOOL>} pfRegistered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-ispreservedkey
     */
    IsPreservedKey(rguid, pprekey, pfRegistered) {
        result := ComCall(11, this, "ptr", rguid, "ptr", pprekey, "ptr", pfRegistered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<TF_PRESERVEDKEY>} prekey 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cchDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-preservekey
     */
    PreserveKey(tid, rguid, prekey, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(12, this, "uint", tid, "ptr", rguid, "ptr", prekey, "ptr", pchDesc, "uint", cchDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-unpreservekey
     */
    UnpreserveKey(rguid, pprekey) {
        result := ComCall(13, this, "ptr", rguid, "ptr", pprekey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cchDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-setpreservedkeydescription
     */
    SetPreservedKeyDescription(rguid, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(14, this, "ptr", rguid, "ptr", pchDesc, "uint", cchDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-getpreservedkeydescription
     */
    GetPreservedKeyDescription(rguid, pbstrDesc) {
        result := ComCall(15, this, "ptr", rguid, "ptr", pbstrDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeystrokemgr-simulatepreservedkey
     */
    SimulatePreservedKey(pic, rguid, pfEaten) {
        result := ComCall(16, this, "ptr", pic, "ptr", rguid, "ptr", pfEaten, "HRESULT")
        return result
    }
}
