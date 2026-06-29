#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IDataModelManager.ahk" { IDataModelManager }
#Import ".\IModelObject.ahk" { IModelObject }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelManager2 extends IDataModelManager {
    /**
     * The interface identifier for IDataModelManager2
     * @type {Guid}
     */
    static IID := Guid("{f412c5ea-2284-4622-a660-a697160d3312}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelManager2 interfaces
    */
    struct Vtbl extends IDataModelManager.Vtbl {
        AcquireSubNamespace          : IntPtr
        CreateTypedIntrinsicObjectEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {PWSTR} subNamespaceModelName 
     * @param {PWSTR} accessName 
     * @param {IKeyStore} metadata 
     * @returns {IModelObject} 
     */
    AcquireSubNamespace(modelName, subNamespaceModelName, accessName, metadata) {
        modelName := modelName is String ? StrPtr(modelName) : modelName
        subNamespaceModelName := subNamespaceModelName is String ? StrPtr(subNamespaceModelName) : subNamespaceModelName
        accessName := accessName is String ? StrPtr(accessName) : accessName

        result := ComCall(23, this, "ptr", modelName, "ptr", subNamespaceModelName, "ptr", accessName, "ptr", metadata, "ptr*", &namespaceModelObject := 0, "HRESULT")
        return IModelObject(namespaceModelObject)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {IModelObject} 
     */
    CreateTypedIntrinsicObjectEx(_context, intrinsicData, type) {
        result := ComCall(24, this, "ptr", _context, VARIANT.Ptr, intrinsicData, "ptr", type, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    Query(iid) {
        if (IDataModelManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireSubNamespace := CallbackCreate(GetMethod(implObj, "AcquireSubNamespace"), flags, 6)
        this.vtbl.CreateTypedIntrinsicObjectEx := CallbackCreate(GetMethod(implObj, "CreateTypedIntrinsicObjectEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireSubNamespace)
        CallbackFree(this.vtbl.CreateTypedIntrinsicObjectEx)
    }
}
