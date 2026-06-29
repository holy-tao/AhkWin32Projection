#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\Location.ahk" { Location }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }
#Import ".\IModelObject.ahk" { IModelObject }
#Import ".\IDataModelConcept.ahk" { IDataModelConcept }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\ModelObjectKind.ahk" { ModelObjectKind }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostTypeSignature.ahk" { IDebugHostTypeSignature }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelManager extends IUnknown {
    /**
     * The interface identifier for IDataModelManager
     * @type {Guid}
     */
    static IID := Guid("{73fe19f4-a110-4500-8ed9-3c28896f508c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Close                               : IntPtr
        CreateNoValue                       : IntPtr
        CreateErrorObject                   : IntPtr
        CreateTypedObject                   : IntPtr
        CreateTypedObjectReference          : IntPtr
        CreateSyntheticObject               : IntPtr
        CreateDataModelObject               : IntPtr
        CreateIntrinsicObject               : IntPtr
        CreateTypedIntrinsicObject          : IntPtr
        GetModelForTypeSignature            : IntPtr
        GetModelForType                     : IntPtr
        RegisterModelForTypeSignature       : IntPtr
        UnregisterModelForTypeSignature     : IntPtr
        RegisterExtensionForTypeSignature   : IntPtr
        UnregisterExtensionForTypeSignature : IntPtr
        CreateMetadataStore                 : IntPtr
        GetRootNamespace                    : IntPtr
        RegisterNamedModel                  : IntPtr
        UnregisterNamedModel                : IntPtr
        AcquireNamedModel                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    CreateNoValue() {
        result := ComCall(4, this, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwszMessage 
     * @returns {IModelObject} 
     */
    CreateErrorObject(hrError, pwszMessage) {
        pwszMessage := pwszMessage is String ? StrPtr(pwszMessage) : pwszMessage

        result := ComCall(5, this, "int", hrError, "ptr", pwszMessage, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} _objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObject(_context, objectLocation, _objectType) {
        result := ComCall(6, this, "ptr", _context, Location, objectLocation, "ptr", _objectType, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} _objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObjectReference(_context, objectLocation, _objectType) {
        result := ComCall(7, this, "ptr", _context, Location, objectLocation, "ptr", _objectType, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @returns {IModelObject} 
     */
    CreateSyntheticObject(_context) {
        result := ComCall(8, this, "ptr", _context, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {IDataModelConcept} dataModel 
     * @returns {IModelObject} 
     */
    CreateDataModelObject(dataModel) {
        result := ComCall(9, this, "ptr", dataModel, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {ModelObjectKind} objectKind 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {IModelObject} 
     */
    CreateIntrinsicObject(objectKind, intrinsicData) {
        result := ComCall(10, this, ModelObjectKind, objectKind, VARIANT.Ptr, intrinsicData, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {IModelObject} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type) {
        result := ComCall(11, this, VARIANT.Ptr, intrinsicData, "ptr", type, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {IModelObject} 
     */
    GetModelForTypeSignature(typeSignature) {
        result := ComCall(12, this, "ptr", typeSignature, "ptr*", &dataModel := 0, "HRESULT")
        return IModelObject(dataModel)
    }

    /**
     * 
     * @param {IDebugHostType} type 
     * @param {Pointer<IModelObject>} dataModel 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    GetModelForType(type, dataModel, typeSignature, wildcardMatches) {
        result := ComCall(13, this, "ptr", type, IModelObject.Ptr, dataModel, IDebugHostTypeSignature.Ptr, typeSignature, IDebugHostSymbolEnumerator.Ptr, wildcardMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(14, this, "ptr", typeSignature, "ptr", dataModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterModelForTypeSignature(dataModel, typeSignature) {
        result := ComCall(15, this, "ptr", dataModel, "ptr", typeSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterExtensionForTypeSignature(typeSignature, dataModel) {
        result := ComCall(16, this, "ptr", typeSignature, "ptr", dataModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterExtensionForTypeSignature(dataModel, typeSignature) {
        result := ComCall(17, this, "ptr", dataModel, "ptr", typeSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IKeyStore} parentStore 
     * @returns {IKeyStore} 
     */
    CreateMetadataStore(parentStore) {
        result := ComCall(18, this, "ptr", parentStore, "ptr*", &metadataStore := 0, "HRESULT")
        return IKeyStore(metadataStore)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    GetRootNamespace() {
        result := ComCall(19, this, "ptr*", &rootNamespace := 0, "HRESULT")
        return IModelObject(rootNamespace)
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {IModelObject} modeObject 
     * @returns {HRESULT} 
     */
    RegisterNamedModel(modelName, modeObject) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(20, this, "ptr", modelName, "ptr", modeObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @returns {HRESULT} 
     */
    UnregisterNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(21, this, "ptr", modelName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @returns {IModelObject} 
     */
    AcquireNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(22, this, "ptr", modelName, "ptr*", &modelObject := 0, "HRESULT")
        return IModelObject(modelObject)
    }

    Query(iid) {
        if (IDataModelManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.CreateNoValue := CallbackCreate(GetMethod(implObj, "CreateNoValue"), flags, 2)
        this.vtbl.CreateErrorObject := CallbackCreate(GetMethod(implObj, "CreateErrorObject"), flags, 4)
        this.vtbl.CreateTypedObject := CallbackCreate(GetMethod(implObj, "CreateTypedObject"), flags, 5)
        this.vtbl.CreateTypedObjectReference := CallbackCreate(GetMethod(implObj, "CreateTypedObjectReference"), flags, 5)
        this.vtbl.CreateSyntheticObject := CallbackCreate(GetMethod(implObj, "CreateSyntheticObject"), flags, 3)
        this.vtbl.CreateDataModelObject := CallbackCreate(GetMethod(implObj, "CreateDataModelObject"), flags, 3)
        this.vtbl.CreateIntrinsicObject := CallbackCreate(GetMethod(implObj, "CreateIntrinsicObject"), flags, 4)
        this.vtbl.CreateTypedIntrinsicObject := CallbackCreate(GetMethod(implObj, "CreateTypedIntrinsicObject"), flags, 4)
        this.vtbl.GetModelForTypeSignature := CallbackCreate(GetMethod(implObj, "GetModelForTypeSignature"), flags, 3)
        this.vtbl.GetModelForType := CallbackCreate(GetMethod(implObj, "GetModelForType"), flags, 5)
        this.vtbl.RegisterModelForTypeSignature := CallbackCreate(GetMethod(implObj, "RegisterModelForTypeSignature"), flags, 3)
        this.vtbl.UnregisterModelForTypeSignature := CallbackCreate(GetMethod(implObj, "UnregisterModelForTypeSignature"), flags, 3)
        this.vtbl.RegisterExtensionForTypeSignature := CallbackCreate(GetMethod(implObj, "RegisterExtensionForTypeSignature"), flags, 3)
        this.vtbl.UnregisterExtensionForTypeSignature := CallbackCreate(GetMethod(implObj, "UnregisterExtensionForTypeSignature"), flags, 3)
        this.vtbl.CreateMetadataStore := CallbackCreate(GetMethod(implObj, "CreateMetadataStore"), flags, 3)
        this.vtbl.GetRootNamespace := CallbackCreate(GetMethod(implObj, "GetRootNamespace"), flags, 2)
        this.vtbl.RegisterNamedModel := CallbackCreate(GetMethod(implObj, "RegisterNamedModel"), flags, 3)
        this.vtbl.UnregisterNamedModel := CallbackCreate(GetMethod(implObj, "UnregisterNamedModel"), flags, 2)
        this.vtbl.AcquireNamedModel := CallbackCreate(GetMethod(implObj, "AcquireNamedModel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.CreateNoValue)
        CallbackFree(this.vtbl.CreateErrorObject)
        CallbackFree(this.vtbl.CreateTypedObject)
        CallbackFree(this.vtbl.CreateTypedObjectReference)
        CallbackFree(this.vtbl.CreateSyntheticObject)
        CallbackFree(this.vtbl.CreateDataModelObject)
        CallbackFree(this.vtbl.CreateIntrinsicObject)
        CallbackFree(this.vtbl.CreateTypedIntrinsicObject)
        CallbackFree(this.vtbl.GetModelForTypeSignature)
        CallbackFree(this.vtbl.GetModelForType)
        CallbackFree(this.vtbl.RegisterModelForTypeSignature)
        CallbackFree(this.vtbl.UnregisterModelForTypeSignature)
        CallbackFree(this.vtbl.RegisterExtensionForTypeSignature)
        CallbackFree(this.vtbl.UnregisterExtensionForTypeSignature)
        CallbackFree(this.vtbl.CreateMetadataStore)
        CallbackFree(this.vtbl.GetRootNamespace)
        CallbackFree(this.vtbl.RegisterNamedModel)
        CallbackFree(this.vtbl.UnregisterNamedModel)
        CallbackFree(this.vtbl.AcquireNamedModel)
    }
}
