#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the relogging functionality, allowing you to manipulate and relog events from an ETW trace stream.
 * @remarks
 * 
  * This interface is not supported on Windows 7 for the IA64 architecture.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//relogger/nn-relogger-itracerelogger
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceRelogger extends IUnknown{
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
     * 
     * @param {BSTR} LogfileName 
     * @param {Pointer<Void>} UserContext 
     * @param {Pointer<UInt64>} TraceStreamId 
     * @returns {HRESULT} 
     */
    AddLogfileTraceStream(LogfileName, UserContext, TraceStreamId) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        result := ComCall(3, this, "ptr", LogfileName, "ptr", UserContext, "uint*", TraceStreamId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} LoggerName 
     * @param {Pointer<Void>} UserContext 
     * @param {Pointer<UInt64>} TraceStreamId 
     * @returns {HRESULT} 
     */
    AddRealtimeTraceStream(LoggerName, UserContext, TraceStreamId) {
        LoggerName := LoggerName is String ? BSTR.Alloc(LoggerName).Value : LoggerName

        result := ComCall(4, this, "ptr", LoggerName, "ptr", UserContext, "uint*", TraceStreamId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceEventCallback>} Callback 
     * @returns {HRESULT} 
     */
    RegisterCallback(Callback) {
        result := ComCall(5, this, "ptr", Callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceEvent>} Event 
     * @returns {HRESULT} 
     */
    Inject(Event) {
        result := ComCall(6, this, "ptr", Event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TraceStreamId 
     * @param {Integer} Flags 
     * @param {Pointer<ITraceEvent>} Event 
     * @returns {HRESULT} 
     */
    CreateEventInstance(TraceStreamId, Flags, Event) {
        result := ComCall(7, this, "uint", TraceStreamId, "uint", Flags, "ptr", Event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ProcessTrace function delivers events from one or more event tracing sessions to the consumer.
     * @returns {HRESULT} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>HandleCount</i> is not valid or the number of handles is greater than 64.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An element of <i>HandleArray</i> is not a valid event tracing session handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>EndTime</i> is less than <i>StartTime</i>.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>HandleArray</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred in one of the callback functions that receives the events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the consumer canceled processing by returning <b>FALSE</b> in their 
     *         <a href="/windows/desktop/ETW/buffercallback">BufferCallback</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session from which you are trying to consume events in real time is not running or does not have the 
     *         real-time trace mode enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_ALREADY_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>HandleArray</i> parameter contains the handle to more than one real-time 
     *         session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-processtrace
     */
    ProcessTrace() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} LogfileName 
     * @returns {HRESULT} 
     */
    SetOutputFilename(LogfileName) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        result := ComCall(9, this, "ptr", LogfileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} CompressionMode 
     * @returns {HRESULT} 
     */
    SetCompressionMode(CompressionMode) {
        result := ComCall(10, this, "char", CompressionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
