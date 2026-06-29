#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITPluggableTerminalEventSink.ahk" { ITPluggableTerminalEventSink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITPluggableTerminalEventSinkRegistration (msp.h) interface registers and unregisters a client application for pluggable terminal events.
 * @see https://learn.microsoft.com/windows/win32/api/msp/nn-msp-itpluggableterminaleventsinkregistration
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPluggableTerminalEventSinkRegistration extends IUnknown {
    /**
     * The interface identifier for ITPluggableTerminalEventSinkRegistration
     * @type {Guid}
     */
    static IID := Guid("{f7115709-a216-4957-a759-060ab32a90d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPluggableTerminalEventSinkRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterSink   : IntPtr
        UnregisterSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPluggableTerminalEventSinkRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITPluggableTerminalEventSinkRegistration::RegisterSink (msp.h) method registers the application for pluggable terminal event notification.
     * @param {ITPluggableTerminalEventSink} pEventSink Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msp/nn-msp-itpluggableterminaleventsink">ITPluggableTerminalEventSink</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itpluggableterminaleventsinkregistration-registersink
     */
    RegisterSink(pEventSink) {
        result := ComCall(3, this, "ptr", pEventSink, "HRESULT")
        return result
    }

    /**
     * The ITPluggableTerminalEventSinkRegistration::UnregisterSink (msp.h) method clears event registration for pluggable terminal events.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itpluggableterminaleventsinkregistration-unregistersink
     */
    UnregisterSink() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITPluggableTerminalEventSinkRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterSink := CallbackCreate(GetMethod(implObj, "RegisterSink"), flags, 2)
        this.vtbl.UnregisterSink := CallbackCreate(GetMethod(implObj, "UnregisterSink"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterSink)
        CallbackFree(this.vtbl.UnregisterSink)
    }
}
