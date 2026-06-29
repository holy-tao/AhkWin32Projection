#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITraceRelogger.ahk" { ITraceRelogger }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITraceEvent.ahk" { ITraceEvent }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by ETW to provide information to the relogger as the tracing process starts, ends, and logs events.
 * @remarks
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * @see https://learn.microsoft.com/windows/win32/api/relogger/nn-relogger-itraceeventcallback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ITraceEventCallback extends IUnknown {
    /**
     * The interface identifier for ITraceEventCallback
     * @type {Guid}
     */
    static IID := Guid("{3ed25501-593f-43e9-8f38-3ab46f5a4a52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceEventCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBeginProcessTrace    : IntPtr
        OnFinalizeProcessTrace : IntPtr
        OnEvent                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceEventCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a trace is about to begin so that relogging can be started.
     * @param {ITraceEvent} HeaderEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>*</b>
     * 
     * Supplies a pointer to the header event.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * Supplies a pointer to the <b>ITraceRelogger</b> interface, which exposes
     *         APIs for actual event injection, synthesizing new events, and cloning
     *         existing events.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onbeginprocesstrace
     */
    OnBeginProcessTrace(HeaderEvent, Relogger) {
        result := ComCall(3, this, "ptr", HeaderEvent, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * Indicates that a trace is about to end so that relogging can be finalized.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * The trace relogger that was used to register this callback and relog this trace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onfinalizeprocesstrace
     */
    OnFinalizeProcessTrace(Relogger) {
        result := ComCall(4, this, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * Indicates that an event has been received on the trace streams associated with a relogger.
     * @param {ITraceEvent} Event Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>*</b>
     * 
     * The event being logged.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * The trace relogger that was used to register this callback and relog this trace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onevent
     */
    OnEvent(Event, Relogger) {
        result := ComCall(5, this, "ptr", Event, "ptr", Relogger, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITraceEventCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBeginProcessTrace := CallbackCreate(GetMethod(implObj, "OnBeginProcessTrace"), flags, 3)
        this.vtbl.OnFinalizeProcessTrace := CallbackCreate(GetMethod(implObj, "OnFinalizeProcessTrace"), flags, 2)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBeginProcessTrace)
        CallbackFree(this.vtbl.OnFinalizeProcessTrace)
        CallbackFree(this.vtbl.OnEvent)
    }
}
