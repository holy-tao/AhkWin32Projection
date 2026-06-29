#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugStackFrame.ahk" { IDebugStackFrame }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import ".\IActiveScriptError.ahk" { IActiveScriptError }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptErrorDebug extends IActiveScriptError {
    /**
     * The interface identifier for IActiveScriptErrorDebug
     * @type {Guid}
     */
    static IID := Guid("{51973c12-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptErrorDebug interfaces
    */
    struct Vtbl extends IActiveScriptError.Vtbl {
        GetDocumentContext : IntPtr
        GetStackFrame      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptErrorDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugDocumentContext} 
     */
    GetDocumentContext() {
        result := ComCall(6, this, "ptr*", &ppssc := 0, "HRESULT")
        return IDebugDocumentContext(ppssc)
    }

    /**
     * 
     * @returns {IDebugStackFrame} 
     */
    GetStackFrame() {
        result := ComCall(7, this, "ptr*", &ppdsf := 0, "HRESULT")
        return IDebugStackFrame(ppdsf)
    }

    Query(iid) {
        if (IActiveScriptErrorDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentContext := CallbackCreate(GetMethod(implObj, "GetDocumentContext"), flags, 2)
        this.vtbl.GetStackFrame := CallbackCreate(GetMethod(implObj, "GetStackFrame"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentContext)
        CallbackFree(this.vtbl.GetStackFrame)
    }
}
