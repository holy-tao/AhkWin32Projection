#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ITraceEvent>} NewEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-clone
     */
    Clone(NewEvent) {
        result := ComCall(3, this, "ptr*", NewEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} UserContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-getusercontext
     */
    GetUserContext(UserContext) {
        result := ComCall(4, this, "ptr*", UserContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<EVENT_RECORD>>} EventRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-geteventrecord
     */
    GetEventRecord(EventRecord) {
        result := ComCall(5, this, "ptr*", EventRecord, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Payload 
     * @param {Integer} PayloadSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setpayload
     */
    SetPayload(Payload, PayloadSize) {
        result := ComCall(6, this, "char*", Payload, "uint", PayloadSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-seteventdescriptor
     */
    SetEventDescriptor(EventDescriptor) {
        result := ComCall(7, this, "ptr", EventDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProcessId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setprocessid
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
     * 
     * @param {Integer} ThreadId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setthreadid
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
     * 
     * @param {Pointer<Integer>} TimeStamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-settimestamp
     */
    SetTimeStamp(TimeStamp) {
        result := ComCall(13, this, "int64*", TimeStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceevent-setproviderid
     */
    SetProviderId(ProviderId) {
        result := ComCall(14, this, "ptr", ProviderId, "HRESULT")
        return result
    }
}
