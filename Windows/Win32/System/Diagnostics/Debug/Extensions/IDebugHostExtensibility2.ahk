#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugHostExtensibility.ahk" { IDebugHostExtensibility }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostExtensibility2 extends IDebugHostExtensibility {
    /**
     * The interface identifier for IDebugHostExtensibility2
     * @type {Guid}
     */
    static IID := Guid("{91cc55e7-2a22-4494-9710-b729dab48f71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostExtensibility2 interfaces
    */
    struct Vtbl extends IDebugHostExtensibility.Vtbl {
        CreateFunctionAliasWithMetadata : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostExtensibility2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} aliasName 
     * @param {IModelObject} functionObject 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    CreateFunctionAliasWithMetadata(aliasName, functionObject, metadata) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(5, this, "ptr", aliasName, "ptr", functionObject, "ptr", metadata, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostExtensibility2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFunctionAliasWithMetadata := CallbackCreate(GetMethod(implObj, "CreateFunctionAliasWithMetadata"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFunctionAliasWithMetadata)
    }
}
