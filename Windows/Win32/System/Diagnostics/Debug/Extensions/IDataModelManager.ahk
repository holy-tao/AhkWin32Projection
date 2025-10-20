#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelManager extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateNoValue(object) {
        result := ComCall(4, this, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "int", hrError, "ptr", pwszMessage, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} objectLocation 
     * @param {Pointer<IDebugHostType>} objectType 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedObject(context, objectLocation, objectType, object) {
        result := ComCall(6, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} objectLocation 
     * @param {Pointer<IDebugHostType>} objectType 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedObjectReference(context, objectLocation, objectType, object) {
        result := ComCall(7, this, "ptr", context, "ptr", objectLocation, "ptr", objectType, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateSyntheticObject(context, object) {
        result := ComCall(8, this, "ptr", context, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelConcept>} dataModel 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateDataModelObject(dataModel, object) {
        result := ComCall(9, this, "ptr", dataModel, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(10, this, "int", objectKind, "ptr", intrinsicData, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {Pointer<IDebugHostType>} type 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type, object) {
        result := ComCall(11, this, "ptr", intrinsicData, "ptr", type, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IModelObject>} dataModel 
     * @returns {HRESULT} 
     */
    GetModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(12, this, "ptr", typeSignature, "ptr", dataModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} type 
     * @param {Pointer<IModelObject>} dataModel 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    GetModelForType(type, dataModel, typeSignature, wildcardMatches) {
        result := ComCall(13, this, "ptr", type, "ptr", dataModel, "ptr", typeSignature, "ptr", wildcardMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IModelObject>} dataModel 
     * @returns {HRESULT} 
     */
    RegisterModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(14, this, "ptr", typeSignature, "ptr", dataModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} dataModel 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterModelForTypeSignature(dataModel, typeSignature) {
        result := ComCall(15, this, "ptr", dataModel, "ptr", typeSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<IModelObject>} dataModel 
     * @returns {HRESULT} 
     */
    RegisterExtensionForTypeSignature(typeSignature, dataModel) {
        result := ComCall(16, this, "ptr", typeSignature, "ptr", dataModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} dataModel 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterExtensionForTypeSignature(dataModel, typeSignature) {
        result := ComCall(17, this, "ptr", dataModel, "ptr", typeSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IKeyStore>} parentStore 
     * @param {Pointer<IKeyStore>} metadataStore 
     * @returns {HRESULT} 
     */
    CreateMetadataStore(parentStore, metadataStore) {
        result := ComCall(18, this, "ptr", parentStore, "ptr", metadataStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} rootNamespace 
     * @returns {HRESULT} 
     */
    GetRootNamespace(rootNamespace) {
        result := ComCall(19, this, "ptr", rootNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {Pointer<IModelObject>} modeObject 
     * @returns {HRESULT} 
     */
    RegisterNamedModel(modelName, modeObject) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(20, this, "ptr", modelName, "ptr", modeObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @returns {HRESULT} 
     */
    UnregisterNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(21, this, "ptr", modelName, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(22, this, "ptr", modelName, "ptr", modelObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
