#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ScriptDebugEventFilter.ahk" { ScriptDebugEventFilter }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDataModelScriptDebugBreakpointEnumerator.ahk" { IDataModelScriptDebugBreakpointEnumerator }
#Import ".\IDataModelScriptDebugClient.ahk" { IDataModelScriptDebugClient }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScriptDebugBreakpoint.ahk" { IDataModelScriptDebugBreakpoint }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ScriptDebugPosition.ahk" { ScriptDebugPosition }
#Import ".\IDataModelScriptDebugStack.ahk" { IDataModelScriptDebugStack }
#Import ".\ScriptDebugState.ahk" { ScriptDebugState }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebug extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptDebug
     * @type {Guid}
     */
    static IID := Guid("{de8e0945-9750-4471-ab76-a8f79d6ec350}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDebugState        : IntPtr
        GetCurrentPosition   : IntPtr
        GetStack             : IntPtr
        SetBreakpoint        : IntPtr
        FindBreakpointById   : IntPtr
        EnumerateBreakpoints : IntPtr
        GetEventFilter       : IntPtr
        SetEventFilter       : IntPtr
        StartDebugging       : IntPtr
        StopDebugging        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ScriptDebugState} 
     */
    GetDebugState() {
        result := ComCall(3, this, ScriptDebugState)
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
        result := ComCall(4, this, ScriptDebugPosition.Ptr, currentPosition, ScriptDebugPosition.Ptr, positionSpanEnd, BSTR.Ptr, lineText, "HRESULT")
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
     * @param {ScriptDebugEventFilter} eventFilter 
     * @returns {Boolean} 
     */
    GetEventFilter(eventFilter) {
        result := ComCall(9, this, ScriptDebugEventFilter, eventFilter, "int*", &isBreakEnabled := 0, "HRESULT")
        return isBreakEnabled
    }

    /**
     * 
     * @param {ScriptDebugEventFilter} eventFilter 
     * @param {Integer} isBreakEnabled 
     * @returns {HRESULT} 
     */
    SetEventFilter(eventFilter, isBreakEnabled) {
        result := ComCall(10, this, ScriptDebugEventFilter, eventFilter, "char", isBreakEnabled, "HRESULT")
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

    Query(iid) {
        if (IDataModelScriptDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDebugState := CallbackCreate(GetMethod(implObj, "GetDebugState"), flags, 1)
        this.vtbl.GetCurrentPosition := CallbackCreate(GetMethod(implObj, "GetCurrentPosition"), flags, 4)
        this.vtbl.GetStack := CallbackCreate(GetMethod(implObj, "GetStack"), flags, 2)
        this.vtbl.SetBreakpoint := CallbackCreate(GetMethod(implObj, "SetBreakpoint"), flags, 4)
        this.vtbl.FindBreakpointById := CallbackCreate(GetMethod(implObj, "FindBreakpointById"), flags, 3)
        this.vtbl.EnumerateBreakpoints := CallbackCreate(GetMethod(implObj, "EnumerateBreakpoints"), flags, 2)
        this.vtbl.GetEventFilter := CallbackCreate(GetMethod(implObj, "GetEventFilter"), flags, 3)
        this.vtbl.SetEventFilter := CallbackCreate(GetMethod(implObj, "SetEventFilter"), flags, 3)
        this.vtbl.StartDebugging := CallbackCreate(GetMethod(implObj, "StartDebugging"), flags, 2)
        this.vtbl.StopDebugging := CallbackCreate(GetMethod(implObj, "StopDebugging"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDebugState)
        CallbackFree(this.vtbl.GetCurrentPosition)
        CallbackFree(this.vtbl.GetStack)
        CallbackFree(this.vtbl.SetBreakpoint)
        CallbackFree(this.vtbl.FindBreakpointById)
        CallbackFree(this.vtbl.EnumerateBreakpoints)
        CallbackFree(this.vtbl.GetEventFilter)
        CallbackFree(this.vtbl.SetEventFilter)
        CallbackFree(this.vtbl.StartDebugging)
        CallbackFree(this.vtbl.StopDebugging)
    }
}
