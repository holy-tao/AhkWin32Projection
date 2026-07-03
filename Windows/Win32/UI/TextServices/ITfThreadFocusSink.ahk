#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfThreadFocusSink interface is implemented by an application or TSF text service to receive notifications when the thread receives or loses the UI focus.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfthreadfocussink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfThreadFocusSink extends IUnknown {
    /**
     * The interface identifier for ITfThreadFocusSink
     * @type {Guid}
     */
    static IID := Guid("{c0f1db0c-3a20-405c-a303-96b6010a885f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfThreadFocusSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSetThreadFocus  : IntPtr
        OnKillThreadFocus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfThreadFocusSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfThreadFocusSink::OnSetThreadFocus method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadfocussink-onsetthreadfocus
     */
    OnSetThreadFocus() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfThreadFocusSink::OnKillThreadFocus method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadfocussink-onkillthreadfocus
     */
    OnKillThreadFocus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfThreadFocusSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetThreadFocus := CallbackCreate(GetMethod(implObj, "OnSetThreadFocus"), flags, 1)
        this.vtbl.OnKillThreadFocus := CallbackCreate(GetMethod(implObj, "OnKillThreadFocus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetThreadFocus)
        CallbackFree(this.vtbl.OnKillThreadFocus)
    }
}
