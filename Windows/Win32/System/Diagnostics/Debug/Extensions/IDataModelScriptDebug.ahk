#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDataModelScriptDebugStack>} stack 
     * @returns {HRESULT} 
     */
    GetStack(stack) {
        result := ComCall(5, this, "ptr*", stack, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} linePosition 
     * @param {Integer} columnPosition 
     * @param {Pointer<IDataModelScriptDebugBreakpoint>} breakpoint 
     * @returns {HRESULT} 
     */
    SetBreakpoint(linePosition, columnPosition, breakpoint) {
        result := ComCall(6, this, "uint", linePosition, "uint", columnPosition, "ptr*", breakpoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} breakpointId 
     * @param {Pointer<IDataModelScriptDebugBreakpoint>} breakpoint 
     * @returns {HRESULT} 
     */
    FindBreakpointById(breakpointId, breakpoint) {
        result := ComCall(7, this, "uint", breakpointId, "ptr*", breakpoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptDebugBreakpointEnumerator>} breakpointEnum 
     * @returns {HRESULT} 
     */
    EnumerateBreakpoints(breakpointEnum) {
        result := ComCall(8, this, "ptr*", breakpointEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventFilter 
     * @param {Pointer<Boolean>} isBreakEnabled 
     * @returns {HRESULT} 
     */
    GetEventFilter(eventFilter, isBreakEnabled) {
        result := ComCall(9, this, "int", eventFilter, "int*", isBreakEnabled, "HRESULT")
        return result
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
