#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostContext.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include .\IKeyEnumerator.ahk
#Include .\IModelObject.ahk
#Include .\IRawEnumerator.ahk
#Include .\Location.ahk
#Include .\IDebugHostType.ahk
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
     * @returns {IDebugHostContext} 
     */
    GetContext() {
        result := ComCall(3, this, "ptr*", &context := 0, "HRESULT")
        return IDebugHostContext(context)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetKind() {
        result := ComCall(4, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetIntrinsicValue() {
        intrinsicData := VARIANT()
        result := ComCall(5, this, "ptr", intrinsicData, "HRESULT")
        return intrinsicData
    }

    /**
     * 
     * @param {Integer} vt 
     * @returns {VARIANT} 
     */
    GetIntrinsicValueAs(vt) {
        intrinsicData := VARIANT()
        result := ComCall(6, this, "ushort", vt, "ptr", intrinsicData, "HRESULT")
        return intrinsicData
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
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyValues() {
        result := ComCall(9, this, "ptr*", &enumerator := 0, "HRESULT")
        return IKeyEnumerator(enumerator)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @returns {IModelObject} 
     */
    GetRawValue(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(10, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawValues(kind, searchFlags) {
        result := ComCall(11, this, "int", kind, "uint", searchFlags, "ptr*", &enumerator := 0, "HRESULT")
        return IRawEnumerator(enumerator)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    Dereference() {
        result := ComCall(12, this, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    TryCastToRuntimeType() {
        result := ComCall(13, this, "ptr*", &runtimeTypedObject := 0, "HRESULT")
        return IModelObject(runtimeTypedObject)
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
     * @returns {Location} 
     */
    GetLocation() {
        location := Location()
        result := ComCall(15, this, "ptr", location, "HRESULT")
        return location
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetTypeInfo() {
        result := ComCall(16, this, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
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
     * @returns {Integer} 
     */
    GetNumberOfParentModels() {
        result := ComCall(18, this, "uint*", &numModels := 0, "HRESULT")
        return numModels
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
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeys() {
        result := ComCall(26, this, "ptr*", &enumerator := 0, "HRESULT")
        return IKeyEnumerator(enumerator)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyReferences() {
        result := ComCall(27, this, "ptr*", &enumerator := 0, "HRESULT")
        return IKeyEnumerator(enumerator)
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
     * @returns {IModelObject} 
     */
    GetRawReference(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawReferences(kind, searchFlags) {
        result := ComCall(31, this, "int", kind, "uint", searchFlags, "ptr*", &enumerator := 0, "HRESULT")
        return IRawEnumerator(enumerator)
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
     * @returns {IUnknown} 
     */
    GetContextForDataModel(dataModelObject) {
        result := ComCall(33, this, "ptr", dataModelObject, "ptr*", &context := 0, "HRESULT")
        return IUnknown(context)
    }

    /**
     * 
     * @param {IModelObject} other 
     * @returns {IModelObject} 
     */
    Compare(other) {
        result := ComCall(34, this, "ptr", other, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }

    /**
     * 
     * @param {IModelObject} other 
     * @returns {Boolean} 
     */
    IsEqualTo(other) {
        result := ComCall(35, this, "ptr", other, "int*", &equal := 0, "HRESULT")
        return equal
    }
}
