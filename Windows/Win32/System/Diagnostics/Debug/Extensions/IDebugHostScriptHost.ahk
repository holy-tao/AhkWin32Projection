#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataModelScriptHostContext.ahk" { IDataModelScriptHostContext }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostScriptHost extends IUnknown {
    /**
     * The interface identifier for IDebugHostScriptHost
     * @type {Guid}
     */
    static IID := Guid("{b70334a4-b92c-4570-93a1-d3eb686649a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostScriptHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostScriptHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a recognizer context.
     * @param {IDataModelScript} script 
     * @returns {IDataModelScriptHostContext} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createcontext
     */
    CreateContext(script) {
        result := ComCall(3, this, "ptr", script, "ptr*", &scriptContext := 0, "HRESULT")
        return IDataModelScriptHostContext(scriptContext)
    }

    Query(iid) {
        if (IDebugHostScriptHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateContext := CallbackCreate(GetMethod(implObj, "CreateContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateContext)
    }
}
