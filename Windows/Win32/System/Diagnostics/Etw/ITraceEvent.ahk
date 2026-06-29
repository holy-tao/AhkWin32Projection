#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EVENT_RECORD.ahk" { EVENT_RECORD }
#Import ".\EVENT_DESCRIPTOR.ahk" { EVENT_DESCRIPTOR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to data relating to a specific event.
 * @remarks
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * @see https://learn.microsoft.com/windows/win32/api/relogger/nn-relogger-itraceevent
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ITraceEvent extends IUnknown {
    /**
     * The interface identifier for ITraceEvent
     * @type {Guid}
     */
    static IID := Guid("{8cc97f40-9028-4ff3-9b62-7d1f79ca7bcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Clone              : IntPtr
        GetUserContext     : IntPtr
        GetEventRecord     : IntPtr
        SetPayload         : IntPtr
        SetEventDescriptor : IntPtr
        SetProcessId       : IntPtr
        SetProcessorIndex  : IntPtr
        SetThreadId        : IntPtr
        SetThreadTimes     : IntPtr
        SetActivityId      : IntPtr
        SetTimeStamp       : IntPtr
        SetProviderId      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a duplicate copy of an event.
     * @returns {ITraceEvent} Type: <b>IEvent**</b>
     * 
     * The new event.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &NewEvent := 0, "HRESULT")
        return ITraceEvent(NewEvent)
    }

    /**
     * Retrieves the user context associated with the stream to which the event belongs.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The user context. This is the context specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/relogger/nf-relogger-itracerelogger-addlogfiletracestream">ITraceRelogger::AddLogfileTraceStream</a>.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-getusercontext
     */
    GetUserContext() {
        result := ComCall(4, this, "ptr*", &UserContext := 0, "HRESULT")
        return UserContext
    }

    /**
     * Retrieves the event record that describes an event.
     * @remarks
     * Event records describe the metadata associated with an event, such as time logged, length, and the event payload.
     * @returns {Pointer<EVENT_RECORD>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a>*</b>
     * 
     * The event record.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-geteventrecord
     */
    GetEventRecord() {
        result := ComCall(5, this, "ptr*", &EventRecord := 0, "HRESULT")
        return EventRecord
    }

    /**
     * Sets the payload for an event.
     * @remarks
     * Payloads contain only developer-defined data.
     * @param {Pointer<Integer>} Payload Type: <b>BYTE*</b>
     * 
     * The event payload data.
     * @param {Integer} PayloadSize Type: <b>ULONG</b>
     * 
     * Size of the payload data, in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setpayload
     */
    SetPayload(Payload, PayloadSize) {
        PayloadMarshal := Payload is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, PayloadMarshal, Payload, "uint", PayloadSize, "HRESULT")
        return result
    }

    /**
     * Sets the event descriptor for an event.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">PCEVENT_DESCRIPTOR</a></b>
     * 
     * The event descriptor data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-seteventdescriptor
     */
    SetEventDescriptor(EventDescriptor) {
        result := ComCall(7, this, EVENT_DESCRIPTOR.Ptr, EventDescriptor, "HRESULT")
        return result
    }

    /**
     * Assigns an event to a specific process.
     * @param {Integer} ProcessId Type: <b>ULONG</b>
     * 
     * Identifier of the process that should own this event.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setprocessid
     */
    SetProcessId(ProcessId) {
        result := ComCall(8, this, "uint", ProcessId, "HRESULT")
        return result
    }

    /**
     * Sets the processor index in the current thread.
     * @param {Integer} ProcessorIndex The processor index.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setprocessorindex
     */
    SetProcessorIndex(ProcessorIndex) {
        result := ComCall(9, this, "uint", ProcessorIndex, "HRESULT")
        return result
    }

    /**
     * Sets the identifier of a thread that generates an event.
     * @param {Integer} ThreadId Type: <b>ULONG</b>
     * 
     * Identifier of the thread that generates the event.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setthreadid
     */
    SetThreadId(ThreadId) {
        result := ComCall(10, this, "uint", ThreadId, "HRESULT")
        return result
    }

    /**
     * Sets the thread times in the current thread.
     * @param {Integer} KernelTime 
     * @param {Integer} UserTime 
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setthreadtimes
     */
    SetThreadTimes(KernelTime, UserTime) {
        result := ComCall(11, this, "uint", KernelTime, "uint", UserTime, "HRESULT")
        return result
    }

    /**
     * Sets the activity ID in the current thread.
     * @param {Pointer<Guid>} ActivityId The activity ID.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setactivityid
     */
    SetActivityId(ActivityId) {
        result := ComCall(12, this, Guid.Ptr, ActivityId, "HRESULT")
        return result
    }

    /**
     * Sets the time at which an event occurred.
     * @param {Pointer<Integer>} _TimeStamp Type: <b>LARGE_INTEGER*</b>
     * 
     *  The time at which the event occurred, in system time.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-settimestamp
     */
    SetTimeStamp(_TimeStamp) {
        _TimeStampMarshal := _TimeStamp is VarRef ? "int64*" : "ptr"

        result := ComCall(13, this, _TimeStampMarshal, _TimeStamp, "HRESULT")
        return result
    }

    /**
     * Sets the GUID for the provider which traced an event.
     * @param {Pointer<Guid>} ProviderId Type: <b>LPCGUID</b>
     * 
     * Unique identifier of the provider.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setproviderid
     */
    SetProviderId(ProviderId) {
        result := ComCall(14, this, Guid.Ptr, ProviderId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITraceEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.GetUserContext := CallbackCreate(GetMethod(implObj, "GetUserContext"), flags, 2)
        this.vtbl.GetEventRecord := CallbackCreate(GetMethod(implObj, "GetEventRecord"), flags, 2)
        this.vtbl.SetPayload := CallbackCreate(GetMethod(implObj, "SetPayload"), flags, 3)
        this.vtbl.SetEventDescriptor := CallbackCreate(GetMethod(implObj, "SetEventDescriptor"), flags, 2)
        this.vtbl.SetProcessId := CallbackCreate(GetMethod(implObj, "SetProcessId"), flags, 2)
        this.vtbl.SetProcessorIndex := CallbackCreate(GetMethod(implObj, "SetProcessorIndex"), flags, 2)
        this.vtbl.SetThreadId := CallbackCreate(GetMethod(implObj, "SetThreadId"), flags, 2)
        this.vtbl.SetThreadTimes := CallbackCreate(GetMethod(implObj, "SetThreadTimes"), flags, 3)
        this.vtbl.SetActivityId := CallbackCreate(GetMethod(implObj, "SetActivityId"), flags, 2)
        this.vtbl.SetTimeStamp := CallbackCreate(GetMethod(implObj, "SetTimeStamp"), flags, 2)
        this.vtbl.SetProviderId := CallbackCreate(GetMethod(implObj, "SetProviderId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.GetUserContext)
        CallbackFree(this.vtbl.GetEventRecord)
        CallbackFree(this.vtbl.SetPayload)
        CallbackFree(this.vtbl.SetEventDescriptor)
        CallbackFree(this.vtbl.SetProcessId)
        CallbackFree(this.vtbl.SetProcessorIndex)
        CallbackFree(this.vtbl.SetThreadId)
        CallbackFree(this.vtbl.SetThreadTimes)
        CallbackFree(this.vtbl.SetActivityId)
        CallbackFree(this.vtbl.SetTimeStamp)
        CallbackFree(this.vtbl.SetProviderId)
    }
}
