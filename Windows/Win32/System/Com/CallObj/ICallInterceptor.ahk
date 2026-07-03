#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICallFrameEvents.ahk" { ICallFrameEvents }
#Import ".\ICallIndirect.ahk" { ICallIndirect }

/**
 * Supports the registration and un-registering of event sinks wishing to be notified of calls made directly on the interface.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/nn-callobj-icallinterceptor
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct ICallInterceptor extends ICallIndirect {
    /**
     * The interface identifier for ICallInterceptor
     * @type {Guid}
     */
    static IID := Guid("{60c7ca75-896d-11d2-b8b6-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallInterceptor interfaces
    */
    struct Vtbl extends ICallIndirect.Vtbl {
        RegisterSink      : IntPtr
        GetRegisteredSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallInterceptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers an event sink for receiving notifications of method calls.
     * @param {ICallFrameEvents} psink A pointer to the event sink. See <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframeevents">ICallFrameEvents</a>.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallinterceptor-registersink
     */
    RegisterSink(psink) {
        result := ComCall(7, this, "ptr", psink, "HRESULT")
        return result
    }

    /**
     * Retrieves the registered event sink.
     * @returns {ICallFrameEvents} A pointer to a pointer to the event sink. See <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframeevents">ICallFrameEvents</a>.
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallinterceptor-getregisteredsink
     */
    GetRegisteredSink() {
        result := ComCall(8, this, "ptr*", &ppsink := 0, "HRESULT")
        return ICallFrameEvents(ppsink)
    }

    Query(iid) {
        if (ICallInterceptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterSink := CallbackCreate(GetMethod(implObj, "RegisterSink"), flags, 2)
        this.vtbl.GetRegisteredSink := CallbackCreate(GetMethod(implObj, "GetRegisteredSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterSink)
        CallbackFree(this.vtbl.GetRegisteredSink)
    }
}
