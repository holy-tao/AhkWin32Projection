#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ScriptDebugEventInformation.ahk" { ScriptDebugEventInformation }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ScriptExecutionKind.ahk" { ScriptExecutionKind }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebugClient extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptDebugClient
     * @type {Guid}
     */
    static IID := Guid("{53159b6d-d4c4-471b-a863-5b110ca800ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebugClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyDebugEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebugClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<ScriptDebugEventInformation>} pEventInfo 
     * @param {IDataModelScript} pScript 
     * @param {IModelObject} pEventDataObject 
     * @param {Pointer<ScriptExecutionKind>} resumeEventKind 
     * @returns {HRESULT} 
     */
    NotifyDebugEvent(pEventInfo, pScript, pEventDataObject, resumeEventKind) {
        resumeEventKindMarshal := resumeEventKind is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ScriptDebugEventInformation.Ptr, pEventInfo, "ptr", pScript, "ptr", pEventDataObject, resumeEventKindMarshal, resumeEventKind, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataModelScriptDebugClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyDebugEvent := CallbackCreate(GetMethod(implObj, "NotifyDebugEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyDebugEvent)
    }
}
