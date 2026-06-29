#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\INamedModelsEnumerator.ahk" { INamedModelsEnumerator }
#Import ".\IModelObject.ahk" { IModelObject }
#Import ".\IDataModelManager2.ahk" { IDataModelManager2 }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IModelMethod.ahk" { IModelMethod }
#Import ".\IFilteredNamespacePropertyToken.ahk" { IFilteredNamespacePropertyToken }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelManager3 extends IDataModelManager2 {
    /**
     * The interface identifier for IDataModelManager3
     * @type {Guid}
     */
    static IID := Guid("{8642daf8-6ef5-4753-b53f-d83a5cee8100}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelManager3 interfaces
    */
    struct Vtbl extends IDataModelManager2.Vtbl {
        AcquireFilteredSubNamespace : IntPtr
        EnumerateNamedModels        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelManager3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {PWSTR} subNamespaceModelName 
     * @param {PWSTR} accessName 
     * @param {IKeyStore} metadata 
     * @param {IModelMethod} filter 
     * @param {Pointer<IModelObject>} namespaceModelObject 
     * @param {Pointer<IFilteredNamespacePropertyToken>} token 
     * @returns {HRESULT} 
     */
    AcquireFilteredSubNamespace(modelName, subNamespaceModelName, accessName, metadata, filter, namespaceModelObject, token) {
        modelName := modelName is String ? StrPtr(modelName) : modelName
        subNamespaceModelName := subNamespaceModelName is String ? StrPtr(subNamespaceModelName) : subNamespaceModelName
        accessName := accessName is String ? StrPtr(accessName) : accessName

        result := ComCall(25, this, "ptr", modelName, "ptr", subNamespaceModelName, "ptr", accessName, "ptr", metadata, "ptr", filter, IModelObject.Ptr, namespaceModelObject, IFilteredNamespacePropertyToken.Ptr, token, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {INamedModelsEnumerator} 
     */
    EnumerateNamedModels() {
        result := ComCall(26, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return INamedModelsEnumerator(ppEnumerator)
    }

    Query(iid) {
        if (IDataModelManager3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireFilteredSubNamespace := CallbackCreate(GetMethod(implObj, "AcquireFilteredSubNamespace"), flags, 8)
        this.vtbl.EnumerateNamedModels := CallbackCreate(GetMethod(implObj, "EnumerateNamedModels"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireFilteredSubNamespace)
        CallbackFree(this.vtbl.EnumerateNamedModels)
    }
}
