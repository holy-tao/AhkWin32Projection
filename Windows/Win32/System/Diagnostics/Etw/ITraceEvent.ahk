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
     * 
     * @param {Pointer<ITraceEvent>} NewEvent 
     * @returns {HRESULT} 
     */
    Clone(NewEvent) {
        result := ComCall(3, this, "ptr", NewEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} UserContext 
     * @returns {HRESULT} 
     */
    GetUserContext(UserContext) {
        result := ComCall(4, this, "ptr", UserContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<EVENT_RECORD>} EventRecord 
     * @returns {HRESULT} 
     */
    GetEventRecord(EventRecord) {
        result := ComCall(5, this, "ptr", EventRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Payload 
     * @param {Integer} PayloadSize 
     * @returns {HRESULT} 
     */
    SetPayload(Payload, PayloadSize) {
        result := ComCall(6, this, "char*", Payload, "uint", PayloadSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @returns {HRESULT} 
     */
    SetEventDescriptor(EventDescriptor) {
        result := ComCall(7, this, "ptr", EventDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProcessId 
     * @returns {HRESULT} 
     */
    SetProcessId(ProcessId) {
        result := ComCall(8, this, "uint", ProcessId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProcessorIndex 
     * @returns {HRESULT} 
     */
    SetProcessorIndex(ProcessorIndex) {
        result := ComCall(9, this, "uint", ProcessorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ThreadId 
     * @returns {HRESULT} 
     */
    SetThreadId(ThreadId) {
        result := ComCall(10, this, "uint", ThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} KernelTime 
     * @param {Integer} UserTime 
     * @returns {HRESULT} 
     */
    SetThreadTimes(KernelTime, UserTime) {
        result := ComCall(11, this, "uint", KernelTime, "uint", UserTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ActivityId 
     * @returns {HRESULT} 
     */
    SetActivityId(ActivityId) {
        result := ComCall(12, this, "ptr", ActivityId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} TimeStamp 
     * @returns {HRESULT} 
     */
    SetTimeStamp(TimeStamp) {
        result := ComCall(13, this, "int64*", TimeStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @returns {HRESULT} 
     */
    SetProviderId(ProviderId) {
        result := ComCall(14, this, "ptr", ProviderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
