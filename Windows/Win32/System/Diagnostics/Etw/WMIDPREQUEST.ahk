#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * A RegisterTraceGuids-based ("Classic") event provider implements this function to receive notifications from controllers. The WMIDPREQUEST type defines a pointer to this callback function. ControlCallback is a placeholder for the application-defined function name.
 * @remarks
 * This function is specified using the
 * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
 * function. When the controller calls the
 * [EnableTrace](/windows/desktop/ETW/enabletrace) function to enable, disable, or
 * change the enable flags or level, ETW calls this callback. The provider enables
 * or disables itself based on the _RequestCode_ value. Typically, the provider uses
 * this value to set a global flag to indicate its enabled state.
 * 
 * The provider defines its interpretation of being enabled or disabled. Generally,
 * if a provider is enabled, it generates events, but while it is disabled, it does
 * not.
 * 
 * ETW does not pass the enable flags and enable level that the controller passes
 * to the [EnableTrace](/windows/desktop/ETW/enabletrace) function to this
 * callback. To retrieve this information, call the
 * [GetTraceEnableFlags](/windows/desktop/ETW/gettraceenableflags) and
 * [GetTraceEnableLevel](/windows/desktop/ETW/gettraceenablelevel) functions,
 * respectively.
 * 
 * You also need to retrieve the session handle in this callback for future calls.
 * To retrieve the session handle, call the
 * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function.
 * 
 * Your callback function must not call anything that may incur LoadLibrary (more
 * specifically, anything that requires a loader lock).
 * @see https://learn.microsoft.com/windows/win32/api//content/evntrace/nc-evntrace-wmidprequest
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class WMIDPREQUEST extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} RequestCode 
     * @param {Pointer<Void>} RequestContext 
     * @param {Pointer<Integer>} BufferSize 
     * @param {Pointer<Void>} Buffer_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(RequestCode, RequestContext, BufferSize, Buffer_) {
        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        Buffer_Marshal := Buffer_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", RequestCode, RequestContextMarshal, RequestContext, BufferSizeMarshal, BufferSize, Buffer_Marshal, Buffer_, "uint")
        return result
    }
}
