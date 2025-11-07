#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelScriptDebugStack.ahk
#Include .\IDataModelScriptDebugBreakpoint.ahk
#Include .\IDataModelScriptDebugBreakpointEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptDebug
     * @type {Guid}
     */
    static IID => Guid("{de8e0945-9750-4471-ab76-a8f79d6ec350}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDebugState", "GetCurrentPosition", "GetStack", "SetBreakpoint", "FindBreakpointById", "EnumerateBreakpoints", "GetEventFilter", "SetEventFilter", "StartDebugging", "StopDebugging"]

    /**
     * 
     * @returns {Integer} 
     */
    GetDebugState() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ScriptDebugPosition>} currentPosition 
     * @param {Pointer<ScriptDebugPosition>} positionSpanEnd 
     * @param {Pointer<BSTR>} lineText 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(currentPosition, positionSpanEnd, lineText) {
        result := ComCall(4, this, "ptr", currentPosition, "ptr", positionSpanEnd, "ptr", lineText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDataModelScriptDebugStack} 
     */
    GetStack() {
        result := ComCall(5, this, "ptr*", &stack := 0, "HRESULT")
        return IDataModelScriptDebugStack(stack)
    }

    /**
     * 
     * @param {Integer} linePosition 
     * @param {Integer} columnPosition 
     * @returns {IDataModelScriptDebugBreakpoint} 
     */
    SetBreakpoint(linePosition, columnPosition) {
        result := ComCall(6, this, "uint", linePosition, "uint", columnPosition, "ptr*", &breakpoint := 0, "HRESULT")
        return IDataModelScriptDebugBreakpoint(breakpoint)
    }

    /**
     * 
     * @param {Integer} breakpointId 
     * @returns {IDataModelScriptDebugBreakpoint} 
     */
    FindBreakpointById(breakpointId) {
        result := ComCall(7, this, "uint", breakpointId, "ptr*", &breakpoint := 0, "HRESULT")
        return IDataModelScriptDebugBreakpoint(breakpoint)
    }

    /**
     * 
     * @returns {IDataModelScriptDebugBreakpointEnumerator} 
     */
    EnumerateBreakpoints() {
        result := ComCall(8, this, "ptr*", &breakpointEnum := 0, "HRESULT")
        return IDataModelScriptDebugBreakpointEnumerator(breakpointEnum)
    }

    /**
     * 
     * @param {Integer} eventFilter 
     * @returns {Boolean} 
     */
    GetEventFilter(eventFilter) {
        result := ComCall(9, this, "int", eventFilter, "int*", &isBreakEnabled := 0, "HRESULT")
        return isBreakEnabled
    }

    /**
     * 
     * @param {Integer} eventFilter 
     * @param {Integer} isBreakEnabled 
     * @returns {HRESULT} 
     */
    SetEventFilter(eventFilter, isBreakEnabled) {
        result := ComCall(10, this, "int", eventFilter, "char", isBreakEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptDebugClient} debugClient 
     * @returns {HRESULT} 
     */
    StartDebugging(debugClient) {
        result := ComCall(11, this, "ptr", debugClient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptDebugClient} debugClient 
     * @returns {HRESULT} 
     */
    StopDebugging(debugClient) {
        result := ComCall(12, this, "ptr", debugClient, "HRESULT")
        return result
    }
}
