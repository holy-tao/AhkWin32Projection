#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpThreadTask extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpThreadTask interfaces
    */
    struct Vtbl {
        InitThread    : IntPtr
        ThreadProc    : IntPtr
        WindowMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpThreadTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    InitThread(pvTaskData, _hwnd) {
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(0, this, pvTaskDataMarshal, pvTaskData, HWND, _hwnd, "HRESULT")
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
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pfContinueProcessingMarshal := pfContinueProcessing is VarRef ? "int*" : "ptr"

        result := ComCall(1, this, pvTaskDataMarshal, pvTaskData, HANDLE, hExitThreadEvent, HANDLE, hNotifyEvent, HWND, hwndWorker, pfContinueProcessingMarshal, pfContinueProcessing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {HWND} _hWnd 
     * @param {Integer} _Msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {LRESULT} 
     */
    WindowMessage(pvTaskData, _hWnd, _Msg, _wParam, _lParam) {
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"

        result := ComCall(2, this, pvTaskDataMarshal, pvTaskData, HWND, _hWnd, "uint", _Msg, WPARAM, _wParam, LPARAM, _lParam, LRESULT)
        return result
    }

    Query(iid) {
        if (ISpThreadTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
