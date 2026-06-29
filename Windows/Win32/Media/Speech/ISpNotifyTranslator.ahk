#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISpNotifyCallback.ahk" { ISpNotifyCallback }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpNotifySink.ahk" { ISpNotifySink }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpNotifyTranslator extends ISpNotifySink {
    /**
     * The interface identifier for ISpNotifyTranslator
     * @type {Guid}
     */
    static IID := Guid("{aca16614-5d3d-11d2-960e-00c04f8ee628}")

    /**
     * The class identifier for SpNotifyTranslator
     * @type {Guid}
     */
    static CLSID := Guid("{e2ae5372-5d40-11d2-960e-00c04f8ee628}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpNotifyTranslator interfaces
    */
    struct Vtbl extends ISpNotifySink.Vtbl {
        InitWindowMessage    : IntPtr
        InitCallback         : IntPtr
        InitSpNotifyCallback : IntPtr
        InitWin32Event       : IntPtr
        Wait                 : IntPtr
        GetEventHandle       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpNotifyTranslator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} _Msg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    InitWindowMessage(_hWnd, _Msg, _wParam, _lParam) {
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
    InitCallback(_pfnCallback, _wParam, _lParam) {
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
    InitSpNotifyCallback(pSpCallback, _wParam, _lParam) {
        result := ComCall(6, this, "ptr", pSpCallback, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @param {BOOL} fCloseHandleOnRelease 
     * @returns {HRESULT} 
     */
    InitWin32Event(hEvent, fCloseHandleOnRelease) {
        result := ComCall(7, this, HANDLE, hEvent, BOOL, fCloseHandleOnRelease, "HRESULT")
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
        result := ComCall(9, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (ISpNotifyTranslator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitWindowMessage := CallbackCreate(GetMethod(implObj, "InitWindowMessage"), flags, 5)
        this.vtbl.InitCallback := CallbackCreate(GetMethod(implObj, "InitCallback"), flags, 4)
        this.vtbl.InitSpNotifyCallback := CallbackCreate(GetMethod(implObj, "InitSpNotifyCallback"), flags, 4)
        this.vtbl.InitWin32Event := CallbackCreate(GetMethod(implObj, "InitWin32Event"), flags, 3)
        this.vtbl.Wait := CallbackCreate(GetMethod(implObj, "Wait"), flags, 2)
        this.vtbl.GetEventHandle := CallbackCreate(GetMethod(implObj, "GetEventHandle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitWindowMessage)
        CallbackFree(this.vtbl.InitCallback)
        CallbackFree(this.vtbl.InitSpNotifyCallback)
        CallbackFree(this.vtbl.InitWin32Event)
        CallbackFree(this.vtbl.Wait)
        CallbackFree(this.vtbl.GetEventHandle)
    }
}
