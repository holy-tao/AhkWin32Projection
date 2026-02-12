#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITraceEvent.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the relogging functionality, allowing you to manipulate and relog events from an ETW trace stream.
 * @remarks
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nn-relogger-itracerelogger
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceRelogger extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceRelogger
     * @type {Guid}
     */
    static IID => Guid("{f754ad43-3bcc-4286-8009-9c5da214e84e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLogfileTraceStream", "AddRealtimeTraceStream", "RegisterCallback", "Inject", "CreateEventInstance", "ProcessTrace", "SetOutputFilename", "SetCompressionMode", "Cancel"]

    /**
     * Adds a new logfile-based ETW trace stream to the relogger.
     * @remarks
     * Events in the newly-added stream will generate callbacks to the <a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceeventcallback">IEventCallback</a> object associated with this relogger.
     * @param {BSTR} LogfileName Type: <b>BSTR</b>
     * 
     * The file that contains the events to be relogged.
     * @param {Pointer<Void>} UserContext Type: <b>void*</b>
     * 
     * The user context under which to relog these events.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-addlogfiletracestream
     */
    AddLogfileTraceStream(LogfileName, UserContext) {
        if(LogfileName is String) {
            pin := BSTR.Alloc(LogfileName)
            LogfileName := pin.Value
        }

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", LogfileName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TraceStreamId
    }

    /**
     * Adds a new real-time ETW trace stream to the relogger.
     * @remarks
     * Events in the newly-added stream will generate callbacks to the <a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceeventcallback">IEventCallback</a> object associated with this relogger.
     * @param {BSTR} LoggerName Type: <b>BSTR</b>
     * 
     * The real-time logger generating the events to relog
     * @param {Pointer<Void>} UserContext Type: <b>void*</b>
     * 
     * The user context under which to relog these events.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-addrealtimetracestream
     */
    AddRealtimeTraceStream(LoggerName, UserContext) {
        if(LoggerName is String) {
            pin := BSTR.Alloc(LoggerName)
            LoggerName := pin.Value
        }

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", LoggerName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TraceStreamId
    }

    /**
     * Registers an implementation of IEventCallback with the relogger in order to signal trace activity (starting, stopping, and logging new events).
     * @param {ITraceEventCallback} Callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceeventcallback">IEventCallback</a>*</b>
     * 
     * The trace activity information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-registercallback
     */
    RegisterCallback(Callback) {
        result := ComCall(5, this, "ptr", Callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Injects a non-system-generated event into the event stream being written to the output trace logfile.
     * @remarks
     * This is the primary way to indicate which events should go into the output trace logfile.
     * 
     * To preserve an existing event provided by <a href="https://docs.microsoft.com/windows/desktop/api/relogger/nf-relogger-itraceeventcallback-onevent">IEventCallback::OnEvent</a>, this method should be called.
     * @param {ITraceEvent} Event Type: <b>IEvent*</b>
     * 
     * The event to be injected into the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-inject
     */
    Inject(Event) {
        result := ComCall(6, this, "ptr", Event, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Generates a new event.
     * @remarks
     * Event metadata will be pulled from <i>TraceHandle</i> but can be modified by the developer before being logged to a trace.
     * @param {Integer} TraceStreamId 
     * @param {Integer} Flags Type: <b>ULONG</b>
     * 
     * Indicates whether the event is classic or crimson.
     * @returns {ITraceEvent} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>**</b>
     * 
     * The newly generated event.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-createeventinstance
     */
    CreateEventInstance(TraceStreamId, Flags) {
        result := ComCall(7, this, "uint", TraceStreamId, "uint", Flags, "ptr*", &Event := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITraceEvent(Event)
    }

    /**
     * Delivers events from the associated trace streams to the consumer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-processtrace
     */
    ProcessTrace() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates the file to which ETW should write the new, relogged trace.
     * @remarks
     * If the indicated file already exists, it will be overwritten with the new trace.
     * @param {BSTR} LogfileName Type: <b>BSTR</b>
     * 
     * The new filename.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-setoutputfilename
     */
    SetOutputFilename(LogfileName) {
        if(LogfileName is String) {
            pin := BSTR.Alloc(LogfileName)
            LogfileName := pin.Value
        }

        result := ComCall(9, this, "ptr", LogfileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables or disables compression on the relogged trace.
     * @remarks
     * By default, compression will be enabled on a relogged trace.
     * 
     * Compression mode is not supported on Windows 7. By default,  Compression mode it is set to <b>false</b> on Windows 7. When this method is called,   it returns <b>E_NOTIMPL</b> when called on Windows 7.
     * 
     * 
     * Compression mode is set  to <b>true</b> on Windows 8 or Windows Server 2012.
     * 
     * Compressed trace files can only be decoded in Windows 8 or Windows Server 2012.
     * @param {BOOLEAN} CompressionMode Type: <b>BOOLEAN</b>
     * 
     * True if compression is enabled; otherwise, false.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-setcompressionmode
     */
    SetCompressionMode(CompressionMode) {
        result := ComCall(10, this, "char", CompressionMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Terminates the relogging process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/relogger/nf-relogger-itracerelogger-cancel
     */
    Cancel() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
