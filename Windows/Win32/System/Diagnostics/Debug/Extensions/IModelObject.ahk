#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\Location.ahk" { Location }
#Import ".\IKeyEnumerator.ahk" { IKeyEnumerator }
#Import "..\..\..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\SymbolKind.ahk" { SymbolKind }
#Import ".\ModelObjectKind.ahk" { ModelObjectKind }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRawEnumerator.ahk" { IRawEnumerator }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IModelObject extends IUnknown {
    /**
     * The interface identifier for IModelObject
     * @type {Guid}
     */
    static IID := Guid("{e28c7893-3f4b-4b96-baca-293cdc55f45d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModelObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContext              : IntPtr
        GetKind                 : IntPtr
        GetIntrinsicValue       : IntPtr
        GetIntrinsicValueAs     : IntPtr
        GetKeyValue             : IntPtr
        SetKeyValue             : IntPtr
        EnumerateKeyValues      : IntPtr
        GetRawValue             : IntPtr
        EnumerateRawValues      : IntPtr
        Dereference             : IntPtr
        TryCastToRuntimeType    : IntPtr
        GetConcept              : IntPtr
        GetLocation             : IntPtr
        GetTypeInfo             : IntPtr
        GetTargetInfo           : IntPtr
        GetNumberOfParentModels : IntPtr
        GetParentModel          : IntPtr
        AddParentModel          : IntPtr
        RemoveParentModel       : IntPtr
        GetKey                  : IntPtr
        GetKeyReference         : IntPtr
        SetKey                  : IntPtr
        ClearKeys               : IntPtr
        EnumerateKeys           : IntPtr
        EnumerateKeyReferences  : IntPtr
        SetConcept              : IntPtr
        ClearConcepts           : IntPtr
        GetRawReference         : IntPtr
        EnumerateRawReferences  : IntPtr
        SetContextForDataModel  : IntPtr
        GetContextForDataModel  : IntPtr
        Compare                 : IntPtr
        IsEqualTo               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModelObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugHostContext} 
     */
    GetContext() {
        result := ComCall(3, this, "ptr*", &_context := 0, "HRESULT")
        return IDebugHostContext(_context)
    }

    /**
     * 
     * @returns {ModelObjectKind} 
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
        result := ComCall(5, this, VARIANT.Ptr, intrinsicData, "HRESULT")
        return intrinsicData
    }

    /**
     * 
     * @param {VARENUM} vt 
     * @returns {VARIANT} 
     */
    GetIntrinsicValueAs(vt) {
        intrinsicData := VARIANT()
        result := ComCall(6, this, VARENUM, vt, VARIANT.Ptr, intrinsicData, "HRESULT")
        return intrinsicData
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(7, this, "ptr", key, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, _object) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", _object, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyValues() {
        result := ComCall(9, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @param {SymbolKind} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @returns {IModelObject} 
     */
    GetRawValue(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(10, this, SymbolKind, kind, "ptr", name, "uint", searchFlags, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {SymbolKind} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawValues(kind, searchFlags) {
        result := ComCall(11, this, SymbolKind, kind, "uint", searchFlags, "ptr*", &_enumerator := 0, "HRESULT")
        return IRawEnumerator(_enumerator)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    Dereference() {
        result := ComCall(12, this, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
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
        result := ComCall(14, this, Guid.Ptr, conceptId, IUnknown.Ptr, conceptInterface, IKeyStore.Ptr, conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Location} 
     */
    GetLocation() {
        _location := Location()
        result := ComCall(15, this, Location.Ptr, _location, "HRESULT")
        return _location
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
     * @param {Pointer<Location>} _location 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetTargetInfo(_location, type) {
        result := ComCall(17, this, Location.Ptr, _location, IDebugHostType.Ptr, type, "HRESULT")
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
        result := ComCall(19, this, "uint", i, IModelObject.Ptr, model, IModelObject.Ptr, contextObject, "HRESULT")
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
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(22, this, "ptr", key, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
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

        result := ComCall(23, this, "ptr", key, IModelObject.Ptr, objectReference, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(24, this, "ptr", key, "ptr", _object, "ptr", metadata, "HRESULT")
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
        result := ComCall(26, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyReferences() {
        result := ComCall(27, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(28, this, Guid.Ptr, conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "HRESULT")
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
     * @param {SymbolKind} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @returns {IModelObject} 
     */
    GetRawReference(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, SymbolKind, kind, "ptr", name, "uint", searchFlags, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {SymbolKind} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawReferences(kind, searchFlags) {
        result := ComCall(31, this, SymbolKind, kind, "uint", searchFlags, "ptr*", &_enumerator := 0, "HRESULT")
        return IRawEnumerator(_enumerator)
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @param {IUnknown} _context 
     * @returns {HRESULT} 
     */
    SetContextForDataModel(dataModelObject, _context) {
        result := ComCall(32, this, "ptr", dataModelObject, "ptr", _context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @returns {IUnknown} 
     */
    GetContextForDataModel(dataModelObject) {
        result := ComCall(33, this, "ptr", dataModelObject, "ptr*", &_context := 0, "HRESULT")
        return IUnknown(_context)
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

    Query(iid) {
        if (IModelObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
        this.vtbl.GetKind := CallbackCreate(GetMethod(implObj, "GetKind"), flags, 2)
        this.vtbl.GetIntrinsicValue := CallbackCreate(GetMethod(implObj, "GetIntrinsicValue"), flags, 2)
        this.vtbl.GetIntrinsicValueAs := CallbackCreate(GetMethod(implObj, "GetIntrinsicValueAs"), flags, 3)
        this.vtbl.GetKeyValue := CallbackCreate(GetMethod(implObj, "GetKeyValue"), flags, 4)
        this.vtbl.SetKeyValue := CallbackCreate(GetMethod(implObj, "SetKeyValue"), flags, 3)
        this.vtbl.EnumerateKeyValues := CallbackCreate(GetMethod(implObj, "EnumerateKeyValues"), flags, 2)
        this.vtbl.GetRawValue := CallbackCreate(GetMethod(implObj, "GetRawValue"), flags, 5)
        this.vtbl.EnumerateRawValues := CallbackCreate(GetMethod(implObj, "EnumerateRawValues"), flags, 4)
        this.vtbl.Dereference := CallbackCreate(GetMethod(implObj, "Dereference"), flags, 2)
        this.vtbl.TryCastToRuntimeType := CallbackCreate(GetMethod(implObj, "TryCastToRuntimeType"), flags, 2)
        this.vtbl.GetConcept := CallbackCreate(GetMethod(implObj, "GetConcept"), flags, 4)
        this.vtbl.GetLocation := CallbackCreate(GetMethod(implObj, "GetLocation"), flags, 2)
        this.vtbl.GetTypeInfo := CallbackCreate(GetMethod(implObj, "GetTypeInfo"), flags, 2)
        this.vtbl.GetTargetInfo := CallbackCreate(GetMethod(implObj, "GetTargetInfo"), flags, 3)
        this.vtbl.GetNumberOfParentModels := CallbackCreate(GetMethod(implObj, "GetNumberOfParentModels"), flags, 2)
        this.vtbl.GetParentModel := CallbackCreate(GetMethod(implObj, "GetParentModel"), flags, 4)
        this.vtbl.AddParentModel := CallbackCreate(GetMethod(implObj, "AddParentModel"), flags, 4)
        this.vtbl.RemoveParentModel := CallbackCreate(GetMethod(implObj, "RemoveParentModel"), flags, 2)
        this.vtbl.GetKey := CallbackCreate(GetMethod(implObj, "GetKey"), flags, 4)
        this.vtbl.GetKeyReference := CallbackCreate(GetMethod(implObj, "GetKeyReference"), flags, 4)
        this.vtbl.SetKey := CallbackCreate(GetMethod(implObj, "SetKey"), flags, 4)
        this.vtbl.ClearKeys := CallbackCreate(GetMethod(implObj, "ClearKeys"), flags, 1)
        this.vtbl.EnumerateKeys := CallbackCreate(GetMethod(implObj, "EnumerateKeys"), flags, 2)
        this.vtbl.EnumerateKeyReferences := CallbackCreate(GetMethod(implObj, "EnumerateKeyReferences"), flags, 2)
        this.vtbl.SetConcept := CallbackCreate(GetMethod(implObj, "SetConcept"), flags, 4)
        this.vtbl.ClearConcepts := CallbackCreate(GetMethod(implObj, "ClearConcepts"), flags, 1)
        this.vtbl.GetRawReference := CallbackCreate(GetMethod(implObj, "GetRawReference"), flags, 5)
        this.vtbl.EnumerateRawReferences := CallbackCreate(GetMethod(implObj, "EnumerateRawReferences"), flags, 4)
        this.vtbl.SetContextForDataModel := CallbackCreate(GetMethod(implObj, "SetContextForDataModel"), flags, 3)
        this.vtbl.GetContextForDataModel := CallbackCreate(GetMethod(implObj, "GetContextForDataModel"), flags, 3)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 3)
        this.vtbl.IsEqualTo := CallbackCreate(GetMethod(implObj, "IsEqualTo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.GetKind)
        CallbackFree(this.vtbl.GetIntrinsicValue)
        CallbackFree(this.vtbl.GetIntrinsicValueAs)
        CallbackFree(this.vtbl.GetKeyValue)
        CallbackFree(this.vtbl.SetKeyValue)
        CallbackFree(this.vtbl.EnumerateKeyValues)
        CallbackFree(this.vtbl.GetRawValue)
        CallbackFree(this.vtbl.EnumerateRawValues)
        CallbackFree(this.vtbl.Dereference)
        CallbackFree(this.vtbl.TryCastToRuntimeType)
        CallbackFree(this.vtbl.GetConcept)
        CallbackFree(this.vtbl.GetLocation)
        CallbackFree(this.vtbl.GetTypeInfo)
        CallbackFree(this.vtbl.GetTargetInfo)
        CallbackFree(this.vtbl.GetNumberOfParentModels)
        CallbackFree(this.vtbl.GetParentModel)
        CallbackFree(this.vtbl.AddParentModel)
        CallbackFree(this.vtbl.RemoveParentModel)
        CallbackFree(this.vtbl.GetKey)
        CallbackFree(this.vtbl.GetKeyReference)
        CallbackFree(this.vtbl.SetKey)
        CallbackFree(this.vtbl.ClearKeys)
        CallbackFree(this.vtbl.EnumerateKeys)
        CallbackFree(this.vtbl.EnumerateKeyReferences)
        CallbackFree(this.vtbl.SetConcept)
        CallbackFree(this.vtbl.ClearConcepts)
        CallbackFree(this.vtbl.GetRawReference)
        CallbackFree(this.vtbl.EnumerateRawReferences)
        CallbackFree(this.vtbl.SetContextForDataModel)
        CallbackFree(this.vtbl.GetContextForDataModel)
        CallbackFree(this.vtbl.Compare)
        CallbackFree(this.vtbl.IsEqualTo)
    }
}
