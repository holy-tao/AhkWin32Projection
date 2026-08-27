#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataModelConcept.ahk" { IDataModelConcept }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }
#Import ".\IDebugHostType.ahk" { IDebugHostType }
#Import ".\IDebugHostTypeSignature.ahk" { IDebugHostTypeSignature }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import ".\Location.ahk" { Location }
#Import ".\ModelObjectKind.ahk" { ModelObjectKind }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

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
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * @returns {IModelObject} 
     */
    CreateNoValue() {
        result := ComCall(4, this, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwszMessage 
     * @returns {IModelObject} 
     */
    CreateErrorObject(hrError, pwszMessage) {
        pwszMessage := pwszMessage is String ? StrPtr(pwszMessage) : pwszMessage

        pwszMessageMarshal := pwszMessage == 0 ? IntPtr : PWSTR

        result := ComCall(5, this, "int", hrError, pwszMessageMarshal, pwszMessage, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {IDebugHostContext} _context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} _objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObject(_context, objectLocation, _objectType) {
        _contextMarshal := _context == 0 ? IntPtr : "ptr"

        result := ComCall(6, this, _contextMarshal, _context, Location, objectLocation, "ptr", _objectType, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {IDebugHostContext} _context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} _objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObjectReference(_context, objectLocation, _objectType) {
        _contextMarshal := _context == 0 ? IntPtr : "ptr"

        result := ComCall(7, this, _contextMarshal, _context, Location, objectLocation, "ptr", _objectType, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {IDebugHostContext} _context 
     * @returns {IModelObject} 
     */
    CreateSyntheticObject(_context) {
        _contextMarshal := _context == 0 ? IntPtr : "ptr"

        result := ComCall(8, this, _contextMarshal, _context, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {IDataModelConcept} dataModel 
     * @returns {IModelObject} 
     */
    CreateDataModelObject(dataModel) {
        result := ComCall(9, this, "ptr", dataModel, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {ModelObjectKind} objectKind 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {IModelObject} 
     */
    CreateIntrinsicObject(objectKind, intrinsicData) {
        result := ComCall(10, this, ModelObjectKind, objectKind, VARIANT.Ptr, intrinsicData, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {IModelObject} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type) {
        result := ComCall(11, this, VARIANT.Ptr, intrinsicData, "ptr", type, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {IModelObject} 
     */
    GetModelForTypeSignature(typeSignature) {
        result := ComCall(12, this, "ptr", typeSignature, "ptr*", &dataModel := 0, "HRESULT")
        return IModelObject(dataModel)
    }

    /**
     * @param {IDebugHostType} type 
     * @param {Pointer<IModelObject>} dataModel 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    GetModelForType(type, dataModel, typeSignature, wildcardMatches) {
        typeSignatureMarshal := typeSignature == 0 ? IntPtr : IDebugHostTypeSignature.Ptr
        wildcardMatchesMarshal := wildcardMatches == 0 ? IntPtr : IDebugHostSymbolEnumerator.Ptr

        result := ComCall(13, this, "ptr", type, IModelObject.Ptr, dataModel, typeSignatureMarshal, typeSignature, wildcardMatchesMarshal, wildcardMatches, "HRESULT")
        return result
    }

    /**
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(14, this, "ptr", typeSignature, "ptr", dataModel, "HRESULT")
        return result
    }

    /**
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterModelForTypeSignature(dataModel, typeSignature) {
        typeSignatureMarshal := typeSignature == 0 ? IntPtr : "ptr"

        result := ComCall(15, this, "ptr", dataModel, typeSignatureMarshal, typeSignature, "HRESULT")
        return result
    }

    /**
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterExtensionForTypeSignature(typeSignature, dataModel) {
        result := ComCall(16, this, "ptr", typeSignature, "ptr", dataModel, "HRESULT")
        return result
    }

    /**
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterExtensionForTypeSignature(dataModel, typeSignature) {
        typeSignatureMarshal := typeSignature == 0 ? IntPtr : "ptr"

        result := ComCall(17, this, "ptr", dataModel, typeSignatureMarshal, typeSignature, "HRESULT")
        return result
    }

    /**
     * @param {IKeyStore} parentStore 
     * @returns {IKeyStore} 
     */
    CreateMetadataStore(parentStore) {
        parentStoreMarshal := parentStore == 0 ? IntPtr : "ptr"

        result := ComCall(18, this, parentStoreMarshal, parentStore, "ptr*", &metadataStore := 0, "HRESULT")
        return IKeyStore(metadataStore)
    }

    /**
     * @returns {IModelObject} 
     */
    GetRootNamespace() {
        result := ComCall(19, this, "ptr*", &rootNamespace := 0, "HRESULT")
        return IModelObject(rootNamespace)
    }

    /**
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
     * @param {PWSTR} modelName 
     * @returns {HRESULT} 
     */
    UnregisterNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(21, this, "ptr", modelName, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} modelName 
     * @returns {IModelObject} 
     */
    AcquireNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(22, this, "ptr", modelName, "ptr*", &modelObject := 0, "HRESULT")
        return IModelObject(modelObject)
    }

    _Query(iid) {
        if (IDataModelManager.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(ObjBindMethod(implObj, "Close"), flags, 1)
        this.vtbl.CreateNoValue := CallbackCreate(ObjBindMethod(implObj, "CreateNoValue"), flags, 2)
        this.vtbl.CreateErrorObject := CallbackCreate(ObjBindMethod(implObj, "CreateErrorObject"), flags, 4)
        this.vtbl.CreateTypedObject := CallbackCreate(ObjBindMethod(implObj, "CreateTypedObject"), flags, 5)
        this.vtbl.CreateTypedObjectReference := CallbackCreate(ObjBindMethod(implObj, "CreateTypedObjectReference"), flags, 5)
        this.vtbl.CreateSyntheticObject := CallbackCreate(ObjBindMethod(implObj, "CreateSyntheticObject"), flags, 3)
        this.vtbl.CreateDataModelObject := CallbackCreate(ObjBindMethod(implObj, "CreateDataModelObject"), flags, 3)
        this.vtbl.CreateIntrinsicObject := CallbackCreate(ObjBindMethod(implObj, "CreateIntrinsicObject"), flags, 4)
        this.vtbl.CreateTypedIntrinsicObject := CallbackCreate(ObjBindMethod(implObj, "CreateTypedIntrinsicObject"), flags, 4)
        this.vtbl.GetModelForTypeSignature := CallbackCreate(ObjBindMethod(implObj, "GetModelForTypeSignature"), flags, 3)
        this.vtbl.GetModelForType := CallbackCreate(ObjBindMethod(implObj, "GetModelForType"), flags, 5)
        this.vtbl.RegisterModelForTypeSignature := CallbackCreate(ObjBindMethod(implObj, "RegisterModelForTypeSignature"), flags, 3)
        this.vtbl.UnregisterModelForTypeSignature := CallbackCreate(ObjBindMethod(implObj, "UnregisterModelForTypeSignature"), flags, 3)
        this.vtbl.RegisterExtensionForTypeSignature := CallbackCreate(ObjBindMethod(implObj, "RegisterExtensionForTypeSignature"), flags, 3)
        this.vtbl.UnregisterExtensionForTypeSignature := CallbackCreate(ObjBindMethod(implObj, "UnregisterExtensionForTypeSignature"), flags, 3)
        this.vtbl.CreateMetadataStore := CallbackCreate(ObjBindMethod(implObj, "CreateMetadataStore"), flags, 3)
        this.vtbl.GetRootNamespace := CallbackCreate(ObjBindMethod(implObj, "GetRootNamespace"), flags, 2)
        this.vtbl.RegisterNamedModel := CallbackCreate(ObjBindMethod(implObj, "RegisterNamedModel"), flags, 3)
        this.vtbl.UnregisterNamedModel := CallbackCreate(ObjBindMethod(implObj, "UnregisterNamedModel"), flags, 2)
        this.vtbl.AcquireNamedModel := CallbackCreate(ObjBindMethod(implObj, "AcquireNamedModel"), flags, 3)
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
