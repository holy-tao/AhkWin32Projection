#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITraceEvent.ahk" { ITraceEvent }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITraceEventCallback.ahk" { ITraceEventCallback }

/**
 * Provides access to the relogging functionality, allowing you to manipulate and relog events from an ETW trace stream.
 * @remarks
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * @see https://learn.microsoft.com/windows/win32/api/relogger/nn-relogger-itracerelogger
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ITraceRelogger extends IUnknown {
    /**
     * The interface identifier for ITraceRelogger
     * @type {Guid}
     */
    static IID := Guid("{f754ad43-3bcc-4286-8009-9c5da214e84e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceRelogger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddLogfileTraceStream  : IntPtr
        AddRealtimeTraceStream : IntPtr
        RegisterCallback       : IntPtr
        Inject                 : IntPtr
        CreateEventInstance    : IntPtr
        ProcessTrace           : IntPtr
        SetOutputFilename      : IntPtr
        SetCompressionMode     : IntPtr
        Cancel                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceRelogger.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-addlogfiletracestream
     */
    AddLogfileTraceStream(LogfileName, UserContext) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, BSTR, LogfileName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-addrealtimetracestream
     */
    AddRealtimeTraceStream(LoggerName, UserContext) {
        LoggerName := LoggerName is String ? BSTR.Alloc(LoggerName).Value : LoggerName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, BSTR, LoggerName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-registercallback
     */
    RegisterCallback(Callback) {
        result := ComCall(5, this, "ptr", Callback, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-inject
     */
    Inject(Event) {
        result := ComCall(6, this, "ptr", Event, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-createeventinstance
     */
    CreateEventInstance(TraceStreamId, Flags) {
        result := ComCall(7, this, "uint", TraceStreamId, "uint", Flags, "ptr*", &Event := 0, "HRESULT")
        return ITraceEvent(Event)
    }

    /**
     * Delivers events from the associated trace streams to the consumer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-processtrace
     */
    ProcessTrace() {
        result := ComCall(8, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-setoutputfilename
     */
    SetOutputFilename(LogfileName) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        result := ComCall(9, this, BSTR, LogfileName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-setcompressionmode
     */
    SetCompressionMode(CompressionMode) {
        result := ComCall(10, this, BOOLEAN, CompressionMode, "HRESULT")
        return result
    }

    /**
     * Terminates the relogging process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itracerelogger-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITraceRelogger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddLogfileTraceStream := CallbackCreate(GetMethod(implObj, "AddLogfileTraceStream"), flags, 4)
        this.vtbl.AddRealtimeTraceStream := CallbackCreate(GetMethod(implObj, "AddRealtimeTraceStream"), flags, 4)
        this.vtbl.RegisterCallback := CallbackCreate(GetMethod(implObj, "RegisterCallback"), flags, 2)
        this.vtbl.Inject := CallbackCreate(GetMethod(implObj, "Inject"), flags, 2)
        this.vtbl.CreateEventInstance := CallbackCreate(GetMethod(implObj, "CreateEventInstance"), flags, 4)
        this.vtbl.ProcessTrace := CallbackCreate(GetMethod(implObj, "ProcessTrace"), flags, 1)
        this.vtbl.SetOutputFilename := CallbackCreate(GetMethod(implObj, "SetOutputFilename"), flags, 2)
        this.vtbl.SetCompressionMode := CallbackCreate(GetMethod(implObj, "SetCompressionMode"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddLogfileTraceStream)
        CallbackFree(this.vtbl.AddRealtimeTraceStream)
        CallbackFree(this.vtbl.RegisterCallback)
        CallbackFree(this.vtbl.Inject)
        CallbackFree(this.vtbl.CreateEventInstance)
        CallbackFree(this.vtbl.ProcessTrace)
        CallbackFree(this.vtbl.SetOutputFilename)
        CallbackFree(this.vtbl.SetCompressionMode)
        CallbackFree(this.vtbl.Cancel)
    }
}
