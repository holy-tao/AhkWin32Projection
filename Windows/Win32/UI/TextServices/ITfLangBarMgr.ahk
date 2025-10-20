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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseEventSink", "UnadviseEventSink", "GetThreadMarshalInterface", "GetThreadLangBarItemMgr", "GetInputProcessorProfiles", "RestoreLastFocus", "SetModalInput", "ShowFloating", "GetShowFloatingStatus"]

    /**
     * 
     * @param {ITfLangBarEventSink} pSink 
     * @param {HWND} hwnd 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-adviseeventsink
     */
    AdviseEventSink(pSink, hwnd, dwFlags, pdwCookie) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", pSink, "ptr", hwnd, "uint", dwFlags, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-unadviseeventsink
     */
    UnadviseEventSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Integer} dwType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-getthreadmarshalinterface
     */
    GetThreadMarshalInterface(dwThreadId, dwType, riid, ppunk) {
        result := ComCall(5, this, "uint", dwThreadId, "uint", dwType, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfLangBarItemMgr>} pplbi 
     * @param {Pointer<Integer>} pdwThreadid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-getthreadlangbaritemmgr
     */
    GetThreadLangBarItemMgr(dwThreadId, pplbi, pdwThreadid) {
        result := ComCall(6, this, "uint", dwThreadId, "ptr*", pplbi, "uint*", pdwThreadid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfInputProcessorProfiles>} ppaip 
     * @param {Pointer<Integer>} pdwThreadid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-getinputprocessorprofiles
     */
    GetInputProcessorProfiles(dwThreadId, ppaip, pdwThreadid) {
        result := ComCall(7, this, "uint", dwThreadId, "ptr*", ppaip, "uint*", pdwThreadid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwThreadId 
     * @param {BOOL} fPrev 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-restorelastfocus
     */
    RestoreLastFocus(pdwThreadId, fPrev) {
        result := ComCall(8, this, "uint*", pdwThreadId, "int", fPrev, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfLangBarEventSink} pSink 
     * @param {Integer} dwThreadId 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-setmodalinput
     */
    SetModalInput(pSink, dwThreadId, dwFlags) {
        result := ComCall(9, this, "ptr", pSink, "uint", dwThreadId, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-showfloating
     */
    ShowFloating(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbarmgr-getshowfloatingstatus
     */
    GetShowFloatingStatus(pdwFlags) {
        result := ComCall(11, this, "uint*", pdwFlags, "HRESULT")
        return result
    }
}
