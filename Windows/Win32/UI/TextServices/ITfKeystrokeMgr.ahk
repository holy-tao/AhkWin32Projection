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
     * 
     * @param {Integer} tid 
     * @param {Pointer<ITfKeyEventSink>} pSink 
     * @param {BOOL} fForeground 
     * @returns {HRESULT} 
     */
    AdviseKeyEventSink(tid, pSink, fForeground) {
        result := ComCall(3, this, "uint", tid, "ptr", pSink, "int", fForeground, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @returns {HRESULT} 
     */
    UnadviseKeyEventSink(tid) {
        result := ComCall(4, this, "uint", tid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetForeground(pclsid) {
        result := ComCall(5, this, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    TestKeyDown(wParam, lParam, pfEaten) {
        result := ComCall(6, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    TestKeyUp(wParam, lParam, pfEaten) {
        result := ComCall(7, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    KeyDown(wParam, lParam, pfEaten) {
        result := ComCall(8, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    KeyUp(wParam, lParam, pfEaten) {
        result := ComCall(9, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetPreservedKey(pic, pprekey, pguid) {
        result := ComCall(10, this, "ptr", pic, "ptr", pprekey, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @param {Pointer<BOOL>} pfRegistered 
     * @returns {HRESULT} 
     */
    IsPreservedKey(rguid, pprekey, pfRegistered) {
        result := ComCall(11, this, "ptr", rguid, "ptr", pprekey, "ptr", pfRegistered, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    PreserveKey(tid, rguid, prekey, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(12, this, "uint", tid, "ptr", rguid, "ptr", prekey, "ptr", pchDesc, "uint", cchDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<TF_PRESERVEDKEY>} pprekey 
     * @returns {HRESULT} 
     */
    UnpreserveKey(rguid, pprekey) {
        result := ComCall(13, this, "ptr", rguid, "ptr", pprekey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cchDesc 
     * @returns {HRESULT} 
     */
    SetPreservedKeyDescription(rguid, pchDesc, cchDesc) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc

        result := ComCall(14, this, "ptr", rguid, "ptr", pchDesc, "uint", cchDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     */
    GetPreservedKeyDescription(rguid, pbstrDesc) {
        result := ComCall(15, this, "ptr", rguid, "ptr", pbstrDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    SimulatePreservedKey(pic, rguid, pfEaten) {
        result := ComCall(16, this, "ptr", pic, "ptr", rguid, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
