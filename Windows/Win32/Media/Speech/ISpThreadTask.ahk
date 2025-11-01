#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpThreadTask extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitThread", "ThreadProc", "WindowMessage"]

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    InitThread(pvTaskData, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(0, this, "ptr", pvTaskData, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HANDLE} hExitThreadEvent 
     * @param {HANDLE} hNotifyEvent 
     * @param {HWND} hwndWorker 
     * @param {Pointer<Integer>} pfContinueProcessing 
     * @returns {HRESULT} 
     */
    ThreadProc(pvTaskData, hExitThreadEvent, hNotifyEvent, hwndWorker, pfContinueProcessing) {
        hExitThreadEvent := hExitThreadEvent is Win32Handle ? NumGet(hExitThreadEvent, "ptr") : hExitThreadEvent
        hNotifyEvent := hNotifyEvent is Win32Handle ? NumGet(hNotifyEvent, "ptr") : hNotifyEvent
        hwndWorker := hwndWorker is Win32Handle ? NumGet(hwndWorker, "ptr") : hwndWorker

        result := ComCall(1, this, "ptr", pvTaskData, "ptr", hExitThreadEvent, "ptr", hNotifyEvent, "ptr", hwndWorker, "int*", pfContinueProcessing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HWND} hWnd 
     * @param {Integer} Msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     */
    WindowMessage(pvTaskData, hWnd, Msg, wParam, lParam) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(2, this, "ptr", pvTaskData, "ptr", hWnd, "uint", Msg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }
}
