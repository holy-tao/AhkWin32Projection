#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugStackFrame.ahk" { IDebugStackFrame }
#Import ".\IScriptInvocationContext.ahk" { IScriptInvocationContext }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_STACKFRAME_TYPE.ahk" { DEBUG_STACKFRAME_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugStackFrame110 extends IDebugStackFrame {
    /**
     * The interface identifier for IDebugStackFrame110
     * @type {Guid}
     */
    static IID := Guid("{4b509611-b6ea-4b24-adcb-d0ccfd1a7e33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugStackFrame110 interfaces
    */
    struct Vtbl extends IDebugStackFrame.Vtbl {
        GetStackFrameType          : IntPtr
        GetScriptInvocationContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugStackFrame110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DEBUG_STACKFRAME_TYPE} 
     */
    GetStackFrameType() {
        result := ComCall(8, this, "int*", &pStackFrameKind := 0, "HRESULT")
        return pStackFrameKind
    }

    /**
     * 
     * @returns {IScriptInvocationContext} 
     */
    GetScriptInvocationContext() {
        result := ComCall(9, this, "ptr*", &ppInvocationContext := 0, "HRESULT")
        return IScriptInvocationContext(ppInvocationContext)
    }

    Query(iid) {
        if (IDebugStackFrame110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStackFrameType := CallbackCreate(GetMethod(implObj, "GetStackFrameType"), flags, 2)
        this.vtbl.GetScriptInvocationContext := CallbackCreate(GetMethod(implObj, "GetScriptInvocationContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStackFrameType)
        CallbackFree(this.vtbl.GetScriptInvocationContext)
    }
}
