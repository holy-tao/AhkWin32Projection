#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITraceEvent.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to data relating to a specific event.
 * @remarks
 * 
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//relogger/nn-relogger-itraceevent
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceEvent
     * @type {Guid}
     */
    static IID => Guid("{8cc97f40-9028-4ff3-9b62-7d1f79ca7bcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "GetUserContext", "GetEventRecord", "SetPayload", "SetEventDescriptor", "SetProcessId", "SetProcessorIndex", "SetThreadId", "SetThreadTimes", "SetActivityId", "SetTimeStamp", "SetProviderId"]

    /**
     * Creates a duplicate copy of an event.
     * @returns {ITraceEvent} Type: <b>IEvent**</b>
     * 
     * The new event.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-clone
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
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-getusercontext
     */
    GetUserContext() {
        result := ComCall(4, this, "ptr*", &UserContext := 0, "HRESULT")
        return UserContext
    }

    /**
     * Retrieves the event record that describes an event.
     * @returns {Pointer<EVENT_RECORD>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a>*</b>
     * 
     * The event record.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-geteventrecord
     */
    GetEventRecord() {
        result := ComCall(5, this, "ptr*", &EventRecord := 0, "HRESULT")
        return EventRecord
    }

    /**
     * Sets the payload for an event.
     * @param {Pointer<Integer>} Payload Type: <b>BYTE*</b>
     * 
     * The event payload data.
     * @param {Integer} PayloadSize Type: <b>ULONG</b>
     * 
     * Size of the payload data, in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-setpayload
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-seteventdescriptor
     */
    SetEventDescriptor(EventDescriptor) {
        result := ComCall(7, this, "ptr", EventDescriptor, "HRESULT")
        return result
    }

    /**
     * Assigns an event to a specific process.
     * @param {Integer} ProcessId Type: <b>ULONG</b>
     * 
     * Identifier of the process that should own this event.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-setprocessid
     */
    SetProcessId(ProcessId) {
        result := ComCall(8, this, "uint", ProcessId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProcessorIndex 
     * @returns {HRESULT} 
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-setthreadid
     */
    SetThreadId(ThreadId) {
        result := ComCall(10, this, "uint", ThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} KernelTime 
     * @param {Integer} UserTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setthreadtimes
     */
    SetThreadTimes(KernelTime, UserTime) {
        result := ComCall(11, this, "uint", KernelTime, "uint", UserTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ActivityId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setactivityid
     */
    SetActivityId(ActivityId) {
        result := ComCall(12, this, "ptr", ActivityId, "HRESULT")
        return result
    }

    /**
     * Sets the time at which an event occurred.
     * @param {Pointer<Integer>} TimeStamp Type: <b>LARGE_INTEGER*</b>
     * 
     *  The time at which the event occurred, in system time.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-settimestamp
     */
    SetTimeStamp(TimeStamp) {
        TimeStampMarshal := TimeStamp is VarRef ? "int64*" : "ptr"

        result := ComCall(13, this, TimeStampMarshal, TimeStamp, "HRESULT")
        return result
    }

    /**
     * Sets the GUID for the provider which traced an event.
     * @param {Pointer<Guid>} ProviderId Type: <b>LPCGUID</b>
     * 
     * Unique identifier of the provider.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceevent-setproviderid
     */
    SetProviderId(ProviderId) {
        result := ComCall(14, this, "ptr", ProviderId, "HRESULT")
        return result
    }
}
