#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ScriptChangeKind.ahk" { ScriptChangeKind }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptHostContext extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptHostContext
     * @type {Guid}
     */
    static IID := Guid("{014d366a-1f23-4981-9219-b2db8b402054}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptHostContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyScriptChange : IntPtr
        GetNamespaceObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptHostContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDataModelScript} script 
     * @param {ScriptChangeKind} _changeKind 
     * @returns {HRESULT} 
     */
    NotifyScriptChange(script, _changeKind) {
        result := ComCall(3, this, "ptr", script, ScriptChangeKind, _changeKind, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    GetNamespaceObject() {
        result := ComCall(4, this, "ptr*", &namespaceObject := 0, "HRESULT")
        return IModelObject(namespaceObject)
    }

    Query(iid) {
        if (IDataModelScriptHostContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyScriptChange := CallbackCreate(GetMethod(implObj, "NotifyScriptChange"), flags, 3)
        this.vtbl.GetNamespaceObject := CallbackCreate(GetMethod(implObj, "GetNamespaceObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyScriptChange)
        CallbackFree(this.vtbl.GetNamespaceObject)
    }
}
