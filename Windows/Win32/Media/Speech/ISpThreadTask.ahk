#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk

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
     * @param {HWND} hwnd_ 
     * @returns {HRESULT} 
     */
    InitThread(pvTaskData, hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(0, this, pvTaskDataMarshal, pvTaskData, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pfContinueProcessingMarshal := pfContinueProcessing is VarRef ? "int*" : "ptr"

        result := ComCall(1, this, pvTaskDataMarshal, pvTaskData, "ptr", hExitThreadEvent, "ptr", hNotifyEvent, "ptr", hwndWorker, pfContinueProcessingMarshal, pfContinueProcessing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HWND} hWnd_ 
     * @param {Integer} Msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {LRESULT} 
     */
    WindowMessage(pvTaskData, hWnd_, Msg_, wParam_, lParam_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(2, this, pvTaskDataMarshal, pvTaskData, "ptr", hWnd_, "uint", Msg_, "ptr", wParam_, "ptr", lParam_, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
