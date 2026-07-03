#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfDisplayAttributeNotifySink interface is implemented by an application to receive a notification when display attribute information is updated.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfdisplayattributenotifysink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfDisplayAttributeNotifySink extends IUnknown {
    /**
     * The interface identifier for ITfDisplayAttributeNotifySink
     * @type {Guid}
     */
    static IID := Guid("{ad56f402-e162-4f25-908f-7d577cf9bda9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfDisplayAttributeNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdateInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfDisplayAttributeNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfDisplayAttributeNotifySink::OnUpdateInfo method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributenotifysink-onupdateinfo
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfDisplayAttributeNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdateInfo := CallbackCreate(GetMethod(implObj, "OnUpdateInfo"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdateInfo)
    }
}
