#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarMgr interface is implemented by the TSF manager and used by text services to manage event sink notification and configure floating language bar display settings. The interface ID is IID_ITfLangBarMgr.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbarmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarMgr extends IUnknown{
    /**
     * The interface identifier for ITfLangBarMgr
     * @type {Guid}
     */
    static IID => Guid("{87955690-e627-11d2-8ddb-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfLangBarEventSink>} pSink 
     * @param {HWND} hwnd 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    AdviseEventSink(pSink, hwnd, dwFlags, pdwCookie) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", pSink, "ptr", hwnd, "uint", dwFlags, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnadviseEventSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Integer} dwType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetThreadMarshalInterface(dwThreadId, dwType, riid, ppunk) {
        result := ComCall(5, this, "uint", dwThreadId, "uint", dwType, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfLangBarItemMgr>} pplbi 
     * @param {Pointer<UInt32>} pdwThreadid 
     * @returns {HRESULT} 
     */
    GetThreadLangBarItemMgr(dwThreadId, pplbi, pdwThreadid) {
        result := ComCall(6, this, "uint", dwThreadId, "ptr", pplbi, "uint*", pdwThreadid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfInputProcessorProfiles>} ppaip 
     * @param {Pointer<UInt32>} pdwThreadid 
     * @returns {HRESULT} 
     */
    GetInputProcessorProfiles(dwThreadId, ppaip, pdwThreadid) {
        result := ComCall(7, this, "uint", dwThreadId, "ptr", ppaip, "uint*", pdwThreadid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwThreadId 
     * @param {BOOL} fPrev 
     * @returns {HRESULT} 
     */
    RestoreLastFocus(pdwThreadId, fPrev) {
        result := ComCall(8, this, "uint*", pdwThreadId, "int", fPrev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfLangBarEventSink>} pSink 
     * @param {Integer} dwThreadId 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetModalInput(pSink, dwThreadId, dwFlags) {
        result := ComCall(9, this, "ptr", pSink, "uint", dwThreadId, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ShowFloating(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetShowFloatingStatus(pdwFlags) {
        result := ComCall(11, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
