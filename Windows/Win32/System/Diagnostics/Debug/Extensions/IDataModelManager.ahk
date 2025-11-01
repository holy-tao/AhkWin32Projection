#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateNoValue(object) {
        result := ComCall(4, this, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwszMessage 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateErrorObject(hrError, pwszMessage, object) {
        pwszMessage := pwszMessage is String ? StrPtr(pwszMessage) : pwszMessage

        result := ComCall(5, this, "int", hrError, "ptr", pwszMessage, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedObject(context, objectLocation, objectType, object) {
        result := ComCall(6, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedObjectReference(context, objectLocation, objectType, object) {
        result := ComCall(7, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateSyntheticObject(context, object) {
        result := ComCall(8, this, "ptr", context, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelConcept} dataModel 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateDataModelObject(dataModel, object) {
        result := ComCall(9, this, "ptr", dataModel, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} objectKind 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateIntrinsicObject(objectKind, intrinsicData, object) {
        result := ComCall(10, this, "int", objectKind, "ptr", intrinsicData, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type, object) {
        result := ComCall(11, this, "ptr", intrinsicData, "ptr", type, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {Pointer<IModelObject>} dataModel 
     * @returns {HRESULT} 
     */
    GetModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(12, this, "ptr", typeSignature, "ptr*", dataModel, "HRESULT")
        return result
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
     * @param {Pointer<IKeyStore>} metadataStore 
     * @returns {HRESULT} 
     */
    CreateMetadataStore(parentStore, metadataStore) {
        result := ComCall(18, this, "ptr", parentStore, "ptr*", metadataStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} rootNamespace 
     * @returns {HRESULT} 
     */
    GetRootNamespace(rootNamespace) {
        result := ComCall(19, this, "ptr*", rootNamespace, "HRESULT")
        return result
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
     * @param {Pointer<IModelObject>} modelObject 
     * @returns {HRESULT} 
     */
    AcquireNamedModel(modelName, modelObject) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(22, this, "ptr", modelName, "ptr*", modelObject, "HRESULT")
        return result
    }
}
