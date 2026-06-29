#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScriptDebugBreakpoint.ahk" { IDataModelScriptDebugBreakpoint }
#Import ".\IDataModelScriptDebug.ahk" { IDataModelScriptDebug }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebug2 extends IDataModelScriptDebug {
    /**
     * The interface identifier for IDataModelScriptDebug2
     * @type {Guid}
     */
    static IID := Guid("{cbb10ed3-839e-426c-9243-e23535c1ae1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebug2 interfaces
    */
    struct Vtbl extends IDataModelScriptDebug.Vtbl {
        SetBreakpointAtFunction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebug2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} functionName 
     * @returns {IDataModelScriptDebugBreakpoint} 
     */
    SetBreakpointAtFunction(functionName) {
        functionName := functionName is String ? StrPtr(functionName) : functionName

        result := ComCall(13, this, "ptr", functionName, "ptr*", &breakpoint := 0, "HRESULT")
        return IDataModelScriptDebugBreakpoint(breakpoint)
    }

    Query(iid) {
        if (IDataModelScriptDebug2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBreakpointAtFunction := CallbackCreate(GetMethod(implObj, "SetBreakpointAtFunction"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBreakpointAtFunction)
    }
}
