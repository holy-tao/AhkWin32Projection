#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include .\IKeyStore.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelManager
     * @type {Guid}
     */
    static IID => Guid("{73fe19f4-a110-4500-8ed9-3c28896f508c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close", "CreateNoValue", "CreateErrorObject", "CreateTypedObject", "CreateTypedObjectReference", "CreateSyntheticObject", "CreateDataModelObject", "CreateIntrinsicObject", "CreateTypedIntrinsicObject", "GetModelForTypeSignature", "GetModelForType", "RegisterModelForTypeSignature", "UnregisterModelForTypeSignature", "RegisterExtensionForTypeSignature", "UnregisterExtensionForTypeSignature", "CreateMetadataStore", "GetRootNamespace", "RegisterNamedModel", "UnregisterNamedModel", "AcquireNamedModel"]

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
        result := ComCall(4, this, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwszMessage 
     * @returns {IModelObject} 
     */
    CreateErrorObject(hrError, pwszMessage) {
        pwszMessage := pwszMessage is String ? StrPtr(pwszMessage) : pwszMessage

        result := ComCall(5, this, "int", hrError, "ptr", pwszMessage, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObject(context, objectLocation, objectType) {
        result := ComCall(6, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType 
     * @returns {IModelObject} 
     */
    CreateTypedObjectReference(context, objectLocation, objectType) {
        result := ComCall(7, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @returns {IModelObject} 
     */
    CreateSyntheticObject(context) {
        result := ComCall(8, this, "ptr", context, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {IDataModelConcept} dataModel 
     * @returns {IModelObject} 
     */
    CreateDataModelObject(dataModel) {
        result := ComCall(9, this, "ptr", dataModel, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {Integer} objectKind 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {IModelObject} 
     */
    CreateIntrinsicObject(objectKind, intrinsicData) {
        result := ComCall(10, this, "int", objectKind, "ptr", intrinsicData, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {IModelObject} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type) {
        result := ComCall(11, this, "ptr", intrinsicData, "ptr", type, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
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
        result := ComCall(13, this, "ptr", type, "ptr*", dataModel, "ptr*", typeSignature, "ptr*", wildcardMatches, "HRESULT")
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
}
