#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebugVariableSetEnumerator extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptDebugVariableSetEnumerator
     * @type {Guid}
     */
    static IID := Guid("{0f9feed7-d045-4ac3-98a8-a98942cf6a35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebugVariableSetEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset   : IntPtr
        GetNext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebugVariableSetEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} variableName 
     * @param {Pointer<IModelObject>} variableValue 
     * @param {Pointer<IKeyStore>} variableMetadata 
     * @returns {HRESULT} 
     */
    GetNext(variableName, variableValue, variableMetadata) {
        result := ComCall(4, this, BSTR.Ptr, variableName, IModelObject.Ptr, variableValue, IKeyStore.Ptr, variableMetadata, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataModelScriptDebugVariableSetEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.GetNext)
    }
}
