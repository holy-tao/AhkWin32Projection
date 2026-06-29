#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostExtensibility extends IUnknown {
    /**
     * The interface identifier for IDebugHostExtensibility
     * @type {Guid}
     */
    static IID := Guid("{3c2b24e1-11d0-4f86-8ae5-4df166f73253}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostExtensibility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateFunctionAlias  : IntPtr
        DestroyFunctionAlias : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostExtensibility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} aliasName 
     * @param {IModelObject} functionObject 
     * @returns {HRESULT} 
     */
    CreateFunctionAlias(aliasName, functionObject) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(3, this, "ptr", aliasName, "ptr", functionObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} aliasName 
     * @returns {HRESULT} 
     */
    DestroyFunctionAlias(aliasName) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(4, this, "ptr", aliasName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostExtensibility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFunctionAlias := CallbackCreate(GetMethod(implObj, "CreateFunctionAlias"), flags, 3)
        this.vtbl.DestroyFunctionAlias := CallbackCreate(GetMethod(implObj, "DestroyFunctionAlias"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFunctionAlias)
        CallbackFree(this.vtbl.DestroyFunctionAlias)
    }
}
