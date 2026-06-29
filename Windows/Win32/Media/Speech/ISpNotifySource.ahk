#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISpNotifyCallback.ahk" { ISpNotifyCallback }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpNotifySink.ahk" { ISpNotifySink }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpNotifySource extends IUnknown {
    /**
     * The interface identifier for ISpNotifySource
     * @type {Guid}
     */
    static IID := Guid("{5eff4aef-8487-11d2-961c-00c04f8ee628}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpNotifySource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetNotifySink              : IntPtr
        SetNotifyWindowMessage     : IntPtr
        SetNotifyCallbackFunction  : IntPtr
        SetNotifyCallbackInterface : IntPtr
        SetNotifyWin32Event        : IntPtr
        WaitForNotifyEvent         : IntPtr
        GetNotifyEventHandle       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpNotifySource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISpNotifySink} pNotifySink 
     * @returns {HRESULT} 
     */
    SetNotifySink(pNotifySink) {
        result := ComCall(3, this, "ptr", pNotifySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} _Msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    SetNotifyWindowMessage(_hWnd, _Msg, _wParam, _lParam) {
        result := ComCall(4, this, HWND, _hWnd, "uint", _Msg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPNOTIFYCALLBACK>>} _pfnCallback 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackFunction(_pfnCallback, _wParam, _lParam) {
        _pfnCallbackMarshal := _pfnCallback is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, _pfnCallbackMarshal, _pfnCallback, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpNotifyCallback} pSpCallback 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackInterface(pSpCallback, _wParam, _lParam) {
        result := ComCall(6, this, "ptr", pSpCallback, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetNotifyWin32Event() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    WaitForNotifyEvent(dwMilliseconds) {
        result := ComCall(8, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @returns {HANDLE} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(9, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (ISpNotifySource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNotifySink := CallbackCreate(GetMethod(implObj, "SetNotifySink"), flags, 2)
        this.vtbl.SetNotifyWindowMessage := CallbackCreate(GetMethod(implObj, "SetNotifyWindowMessage"), flags, 5)
        this.vtbl.SetNotifyCallbackFunction := CallbackCreate(GetMethod(implObj, "SetNotifyCallbackFunction"), flags, 4)
        this.vtbl.SetNotifyCallbackInterface := CallbackCreate(GetMethod(implObj, "SetNotifyCallbackInterface"), flags, 4)
        this.vtbl.SetNotifyWin32Event := CallbackCreate(GetMethod(implObj, "SetNotifyWin32Event"), flags, 1)
        this.vtbl.WaitForNotifyEvent := CallbackCreate(GetMethod(implObj, "WaitForNotifyEvent"), flags, 2)
        this.vtbl.GetNotifyEventHandle := CallbackCreate(GetMethod(implObj, "GetNotifyEventHandle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNotifySink)
        CallbackFree(this.vtbl.SetNotifyWindowMessage)
        CallbackFree(this.vtbl.SetNotifyCallbackFunction)
        CallbackFree(this.vtbl.SetNotifyCallbackInterface)
        CallbackFree(this.vtbl.SetNotifyWin32Event)
        CallbackFree(this.vtbl.WaitForNotifyEvent)
        CallbackFree(this.vtbl.GetNotifyEventHandle)
    }
}
