#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCompartmentEventSink interface is implemented by a client (application or text service) and used by the TSF manager to notify the client when compartment data changes.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcompartmenteventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCompartmentEventSink extends IUnknown {
    /**
     * The interface identifier for ITfCompartmentEventSink
     * @type {Guid}
     */
    static IID := Guid("{743abd5f-f26d-48df-8cc5-238492419b64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCompartmentEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCompartmentEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCompartmentEventSink::OnChange method
     * @remarks
     * When this method is called, the data has changed. The new data can be obtained at this time by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcompartment-getvalue">ITfCompartment::GetValue</a>.
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcompartment-setvalue">ITfCompartment::SetValue</a> will return E_UNEXPECTED if called from within this notification.
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment that changed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartmenteventsink-onchange
     */
    OnChange(rguid) {
        result := ComCall(3, this, Guid.Ptr, rguid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCompartmentEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChange := CallbackCreate(GetMethod(implObj, "OnChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChange)
    }
}
