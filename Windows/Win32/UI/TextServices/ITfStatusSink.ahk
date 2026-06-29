#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfStatusSink interface supports changes to the global document status. This advise sink is installed by calling ITfSource::AdviseSink with IID_ITfStatusSink. A text service can optionally implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfstatussink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfStatusSink extends IUnknown {
    /**
     * The interface identifier for ITfStatusSink
     * @type {Guid}
     */
    static IID := Guid("{6b7d8d73-b267-4f69-b32e-1ca321ce4f45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfStatusSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfStatusSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfStatusSink::OnStatusChange method
     * @remarks
     * This method receives a callback when one of the flags of the <b>dwDynamicFlags</b> member of the <b>TF_STATUS</b> structure changes value. To obtain the changed flag(s), use the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getstatus">ITfContext::GetStatus</a> method.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface whose status has changed.
     * @param {Integer} dwFlags Indicates that one of the dynamic flags changed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfstatussink-onstatuschange
     */
    OnStatusChange(pic, dwFlags) {
        result := ComCall(3, this, "ptr", pic, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfStatusSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStatusChange := CallbackCreate(GetMethod(implObj, "OnStatusChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStatusChange)
    }
}
