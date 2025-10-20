#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpNotifySink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpNotifyTranslator extends ISpNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpNotifyTranslator
     * @type {Guid}
     */
    static IID => Guid("{aca16614-5d3d-11d2-960e-00c04f8ee628}")

    /**
     * The class identifier for SpNotifyTranslator
     * @type {Guid}
     */
    static CLSID => Guid("{e2ae5372-5d40-11d2-960e-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitWindowMessage", "InitCallback", "InitSpNotifyCallback", "InitWin32Event", "Wait", "GetEventHandle"]

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} Msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    InitWindowMessage(hWnd, Msg, wParam, lParam) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "uint", Msg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPNOTIFYCALLBACK>>} pfnCallback 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    InitCallback(pfnCallback, wParam, lParam) {
        result := ComCall(5, this, "ptr*", pfnCallback, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpNotifyCallback} pSpCallback 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    InitSpNotifyCallback(pSpCallback, wParam, lParam) {
        result := ComCall(6, this, "ptr", pSpCallback, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @param {BOOL} fCloseHandleOnRelease 
     * @returns {HRESULT} 
     */
    InitWin32Event(hEvent, fCloseHandleOnRelease) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(7, this, "ptr", hEvent, "int", fCloseHandleOnRelease, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    Wait(dwMilliseconds) {
        result := ComCall(8, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    GetEventHandle() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
