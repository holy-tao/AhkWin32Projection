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
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    CreateNoValue() {
        result := ComCall(4, this, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IModelObject(object_)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwszMessage 
     * @returns {Pointer<IModelObject>} 
     */
    CreateErrorObject(hrError, pwszMessage) {
        pwszMessage := pwszMessage is String ? StrPtr(pwszMessage) : pwszMessage

        result := ComCall(5, this, "int", hrError, "ptr", pwszMessage, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType_ 
     * @returns {IModelObject} 
     */
    CreateTypedObject(context_, objectLocation, objectType_) {
        result := ComCall(6, this, "ptr", context_, "ptr", objectLocation, "ptr", objectType_, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IModelObject(object_)
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} objectLocation 
     * @param {IDebugHostType} objectType_ 
     * @returns {IModelObject} 
     */
    CreateTypedObjectReference(context_, objectLocation, objectType_) {
        result := ComCall(7, this, "ptr", context_, "ptr", objectLocation, "ptr", objectType_, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IModelObject(object_)
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @returns {Pointer<IModelObject>} 
     */
    CreateSyntheticObject(context_) {
        result := ComCall(8, this, "ptr", context_, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * 
     * @param {IDataModelConcept} dataModel 
     * @returns {Pointer<IModelObject>} 
     */
    CreateDataModelObject(dataModel) {
        result := ComCall(9, this, "ptr", dataModel, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * 
     * @param {Integer} objectKind 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {Pointer<IModelObject>} 
     */
    CreateIntrinsicObject(objectKind, intrinsicData) {
        result := ComCall(10, this, "int", objectKind, "ptr", intrinsicData, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {Pointer<IModelObject>} 
     */
    CreateTypedIntrinsicObject(intrinsicData, type) {
        result := ComCall(11, this, "ptr", intrinsicData, "ptr", type, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {IModelObject} 
     */
    GetModelForTypeSignature(typeSignature) {
        result := ComCall(12, this, "ptr", typeSignature, "ptr*", &dataModel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IModelObject(dataModel)
    }

    /**
     * 
     * @param {IDebugHostType} type 
     * @param {Pointer<Pointer<IModelObject>>} dataModel 
     * @param {Pointer<Pointer<IDebugHostTypeSignature>>} typeSignature 
     * @param {Pointer<Pointer<IDebugHostSymbolEnumerator>>} wildcardMatches 
     * @returns {HRESULT} 
     */
    GetModelForType(type, dataModel, typeSignature, wildcardMatches) {
        result := ComCall(13, this, "ptr", type, "ptr*", dataModel, "ptr*", typeSignature, "ptr*", wildcardMatches, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterModelForTypeSignature(typeSignature, dataModel) {
        result := ComCall(14, this, "ptr", typeSignature, "ptr", dataModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterModelForTypeSignature(dataModel, typeSignature) {
        result := ComCall(15, this, "ptr", dataModel, "ptr", typeSignature, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {IModelObject} dataModel 
     * @returns {HRESULT} 
     */
    RegisterExtensionForTypeSignature(typeSignature, dataModel) {
        result := ComCall(16, this, "ptr", typeSignature, "ptr", dataModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IModelObject} dataModel 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {HRESULT} 
     */
    UnregisterExtensionForTypeSignature(dataModel, typeSignature) {
        result := ComCall(17, this, "ptr", dataModel, "ptr", typeSignature, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IKeyStore} parentStore 
     * @returns {Pointer<IKeyStore>} 
     */
    CreateMetadataStore(parentStore) {
        result := ComCall(18, this, "ptr", parentStore, "ptr*", &metadataStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return metadataStore
    }

    /**
     * 
     * @returns {Pointer<IModelObject>} 
     */
    GetRootNamespace() {
        result := ComCall(19, this, "ptr*", &rootNamespace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rootNamespace
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {IModelObject} modeObject 
     * @returns {HRESULT} 
     */
    RegisterNamedModel(modelName, modeObject) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(20, this, "ptr", modelName, "ptr", modeObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} modelName 
     * @returns {Pointer<IModelObject>} 
     */
    AcquireNamedModel(modelName) {
        modelName := modelName is String ? StrPtr(modelName) : modelName

        result := ComCall(22, this, "ptr", modelName, "ptr*", &modelObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modelObject
    }
}
