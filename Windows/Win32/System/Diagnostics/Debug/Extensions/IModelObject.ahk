#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelObject
     * @type {Guid}
     */
    static IID => Guid("{e28c7893-3f4b-4b96-baca-293cdc55f45d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContext", "GetKind", "GetIntrinsicValue", "GetIntrinsicValueAs", "GetKeyValue", "SetKeyValue", "EnumerateKeyValues", "GetRawValue", "EnumerateRawValues", "Dereference", "TryCastToRuntimeType", "GetConcept", "GetLocation", "GetTypeInfo", "GetTargetInfo", "GetNumberOfParentModels", "GetParentModel", "AddParentModel", "RemoveParentModel", "GetKey", "GetKeyReference", "SetKey", "ClearKeys", "EnumerateKeys", "EnumerateKeyReferences", "SetConcept", "ClearConcepts", "GetRawReference", "EnumerateRawReferences", "SetContextForDataModel", "GetContextForDataModel", "Compare", "IsEqualTo"]

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @returns {HRESULT} 
     */
    GetContext(context) {
        result := ComCall(3, this, "ptr*", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} kind 
     * @returns {HRESULT} 
     */
    GetKind(kind) {
        kindMarshal := kind is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, kindMarshal, kind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {HRESULT} 
     */
    GetIntrinsicValue(intrinsicData) {
        result := ComCall(5, this, "ptr", intrinsicData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vt 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @returns {HRESULT} 
     */
    GetIntrinsicValueAs(vt, intrinsicData) {
        result := ComCall(6, this, "ushort", vt, "ptr", intrinsicData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(7, this, "ptr", key, "ptr*", object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} object 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, object) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateKeyValues(enumerator) {
        result := ComCall(9, this, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    GetRawValue(kind, name, searchFlags, object) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(10, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @param {Pointer<IRawEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateRawValues(kind, searchFlags, enumerator) {
        result := ComCall(11, this, "int", kind, "uint", searchFlags, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    Dereference(object) {
        result := ComCall(12, this, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} runtimeTypedObject 
     * @returns {HRESULT} 
     */
    TryCastToRuntimeType(runtimeTypedObject) {
        result := ComCall(13, this, "ptr*", runtimeTypedObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @returns {HRESULT} 
     */
    GetConcept(conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(14, this, "ptr", conceptId, "ptr*", conceptInterface, "ptr*", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Location>} location 
     * @returns {HRESULT} 
     */
    GetLocation(location) {
        result := ComCall(15, this, "ptr", location, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetTypeInfo(type) {
        result := ComCall(16, this, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Location>} location 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetTargetInfo(location, type) {
        result := ComCall(17, this, "ptr", location, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numModels 
     * @returns {HRESULT} 
     */
    GetNumberOfParentModels(numModels) {
        numModelsMarshal := numModels is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, numModelsMarshal, numModels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IModelObject>} model 
     * @param {Pointer<IModelObject>} contextObject 
     * @returns {HRESULT} 
     */
    GetParentModel(i, model, contextObject) {
        result := ComCall(19, this, "uint", i, "ptr*", model, "ptr*", contextObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} model 
     * @param {IModelObject} contextObject 
     * @param {Integer} override 
     * @returns {HRESULT} 
     */
    AddParentModel(model, contextObject, override) {
        result := ComCall(20, this, "ptr", model, "ptr", contextObject, "char", override, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} model 
     * @returns {HRESULT} 
     */
    RemoveParentModel(model) {
        result := ComCall(21, this, "ptr", model, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKey(key, object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(22, this, "ptr", key, "ptr*", object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} objectReference 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyReference(key, objectReference, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(23, this, "ptr", key, "ptr*", objectReference, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(key, object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(24, this, "ptr", key, "ptr", object, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearKeys() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateKeys(enumerator) {
        result := ComCall(26, this, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateKeyReferences(enumerator) {
        result := ComCall(27, this, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(28, this, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearConcepts() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    GetRawReference(kind, name, searchFlags, object) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @param {Pointer<IRawEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateRawReferences(kind, searchFlags, enumerator) {
        result := ComCall(31, this, "int", kind, "uint", searchFlags, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @param {IUnknown} context 
     * @returns {HRESULT} 
     */
    SetContextForDataModel(dataModelObject, context) {
        result := ComCall(32, this, "ptr", dataModelObject, "ptr", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @param {Pointer<IUnknown>} context 
     * @returns {HRESULT} 
     */
    GetContextForDataModel(dataModelObject, context) {
        result := ComCall(33, this, "ptr", dataModelObject, "ptr*", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} other 
     * @param {Pointer<IModelObject>} ppResult 
     * @returns {HRESULT} 
     */
    Compare(other, ppResult) {
        result := ComCall(34, this, "ptr", other, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} other 
     * @param {Pointer<Boolean>} equal 
     * @returns {HRESULT} 
     */
    IsEqualTo(other, equal) {
        equalMarshal := equal is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "ptr", other, equalMarshal, equal, "HRESULT")
        return result
    }
}
