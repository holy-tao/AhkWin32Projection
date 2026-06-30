#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\ISpNotifySink.ahk
#Include .\ISpNotifyCallback.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpNotifyTranslator extends ISpNotifySink {

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
     * @param {HWND} _hWnd 
     * @param {Integer} _Msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    InitWindowMessage(_hWnd, _Msg, _wParam, _lParam) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(4, this, "ptr", _hWnd, "uint", _Msg, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPNOTIFYCALLBACK>>} _pfnCallback 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    InitCallback(_pfnCallback, _wParam, _lParam) {
        _pfnCallbackMarshal := _pfnCallback is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, _pfnCallbackMarshal, _pfnCallback, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpNotifyCallback} pSpCallback 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    InitSpNotifyCallback(pSpCallback, _wParam, _lParam) {
        result := ComCall(6, this, "ptr", pSpCallback, "ptr", _wParam, "ptr", _lParam, "HRESULT")
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
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
