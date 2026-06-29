#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemObjectSet.ahk" { ISWbemObjectSet }
#Import ".\ISWbemPropertySet.ahk" { ISWbemPropertySet }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemObjectPath.ahk" { ISWbemObjectPath }
#Import ".\ISWbemQualifierSet.ahk" { ISWbemQualifierSet }
#Import ".\ISWbemMethodSet.ahk" { ISWbemMethodSet }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemObject extends IDispatch {
    /**
     * The interface identifier for ISWbemObject
     * @type {Guid}
     */
    static IID := Guid("{76a6415a-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemObject
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d62-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemObject interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Put_               : IntPtr
        PutAsync_          : IntPtr
        Delete_            : IntPtr
        DeleteAsync_       : IntPtr
        Instances_         : IntPtr
        InstancesAsync_    : IntPtr
        Subclasses_        : IntPtr
        SubclassesAsync_   : IntPtr
        Associators_       : IntPtr
        AssociatorsAsync_  : IntPtr
        References_        : IntPtr
        ReferencesAsync_   : IntPtr
        ExecMethod_        : IntPtr
        ExecMethodAsync_   : IntPtr
        Clone_             : IntPtr
        GetObjectText_     : IntPtr
        SpawnDerivedClass_ : IntPtr
        SpawnInstance_     : IntPtr
        CompareTo_         : IntPtr
        get_Qualifiers_    : IntPtr
        get_Properties_    : IntPtr
        get_Methods_       : IntPtr
        get_Derivation_    : IntPtr
        get_Path_          : IntPtr
        get_Security_      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISWbemQualifierSet} 
     */
    Qualifiers_ {
        get => this.get_Qualifiers_()
    }

    /**
     * @type {ISWbemPropertySet} 
     */
    Properties_ {
        get => this.get_Properties_()
    }

    /**
     * @type {ISWbemMethodSet} 
     */
    Methods_ {
        get => this.get_Methods_()
    }

    /**
     * @type {VARIANT} 
     */
    Derivation_ {
        get => this.get_Derivation_()
    }

    /**
     * @type {ISWbemObjectPath} 
     */
    Path_ {
        get => this.get_Path_()
    }

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectPath} 
     */
    Put_(iFlags, objWbemNamedValueSet) {
        result := ComCall(7, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectPath := 0, "HRESULT")
        return ISWbemObjectPath(objWbemObjectPath)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    PutAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(8, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Delete_(iFlags, objWbemNamedValueSet) {
        result := ComCall(9, this, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    DeleteAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(10, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    Instances_(iFlags, objWbemNamedValueSet) {
        result := ComCall(11, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    InstancesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(12, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    Subclasses_(iFlags, objWbemNamedValueSet) {
        result := ComCall(13, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    SubclassesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(14, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAssocClass 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strResultRole 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredAssocQualifier 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    Associators_(strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(15, this, BSTR, strAssocClass, BSTR, strResultClass, BSTR, strResultRole, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredAssocQualifier, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strAssocClass 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strResultRole 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredAssocQualifier 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    AssociatorsAsync_(objWbemSink, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(16, this, "ptr", objWbemSink, BSTR, strAssocClass, BSTR, strResultClass, BSTR, strResultRole, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredAssocQualifier, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    References_(strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(17, this, BSTR, strResultClass, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ReferencesAsync_(objWbemSink, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(18, this, "ptr", objWbemSink, BSTR, strResultClass, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObject} 
     */
    ExecMethod_(strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet) {
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(19, this, BSTR, strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemOutParameters := 0, "HRESULT")
        return ISWbemObject(objWbemOutParameters)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecMethodAsync_(objWbemSink, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(20, this, "ptr", objWbemSink, BSTR, strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    Clone_() {
        result := ComCall(21, this, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {BSTR} 
     */
    GetObjectText_(iFlags) {
        strObjectText := BSTR.Owned()
        result := ComCall(22, this, "int", iFlags, BSTR.Ptr, strObjectText, "HRESULT")
        return strObjectText
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {ISWbemObject} 
     */
    SpawnDerivedClass_(iFlags) {
        result := ComCall(23, this, "int", iFlags, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {ISWbemObject} 
     */
    SpawnInstance_(iFlags) {
        result := ComCall(24, this, "int", iFlags, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @param {IDispatch} objWbemObject 
     * @param {Integer} iFlags 
     * @returns {VARIANT_BOOL} 
     */
    CompareTo_(objWbemObject, iFlags) {
        result := ComCall(25, this, "ptr", objWbemObject, "int", iFlags, VARIANT_BOOL.Ptr, &bResult := 0, "HRESULT")
        return bResult
    }

    /**
     * 
     * @returns {ISWbemQualifierSet} 
     */
    get_Qualifiers_() {
        result := ComCall(26, this, "ptr*", &objWbemQualifierSet := 0, "HRESULT")
        return ISWbemQualifierSet(objWbemQualifierSet)
    }

    /**
     * 
     * @returns {ISWbemPropertySet} 
     */
    get_Properties_() {
        result := ComCall(27, this, "ptr*", &objWbemPropertySet := 0, "HRESULT")
        return ISWbemPropertySet(objWbemPropertySet)
    }

    /**
     * 
     * @returns {ISWbemMethodSet} 
     */
    get_Methods_() {
        result := ComCall(28, this, "ptr*", &objWbemMethodSet := 0, "HRESULT")
        return ISWbemMethodSet(objWbemMethodSet)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Derivation_() {
        strClassNameArray := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, strClassNameArray, "HRESULT")
        return strClassNameArray
    }

    /**
     * 
     * @returns {ISWbemObjectPath} 
     */
    get_Path_() {
        result := ComCall(30, this, "ptr*", &objWbemObjectPath := 0, "HRESULT")
        return ISWbemObjectPath(objWbemObjectPath)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(31, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    Query(iid) {
        if (ISWbemObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Put_ := CallbackCreate(GetMethod(implObj, "Put_"), flags, 4)
        this.vtbl.PutAsync_ := CallbackCreate(GetMethod(implObj, "PutAsync_"), flags, 5)
        this.vtbl.Delete_ := CallbackCreate(GetMethod(implObj, "Delete_"), flags, 3)
        this.vtbl.DeleteAsync_ := CallbackCreate(GetMethod(implObj, "DeleteAsync_"), flags, 5)
        this.vtbl.Instances_ := CallbackCreate(GetMethod(implObj, "Instances_"), flags, 4)
        this.vtbl.InstancesAsync_ := CallbackCreate(GetMethod(implObj, "InstancesAsync_"), flags, 5)
        this.vtbl.Subclasses_ := CallbackCreate(GetMethod(implObj, "Subclasses_"), flags, 4)
        this.vtbl.SubclassesAsync_ := CallbackCreate(GetMethod(implObj, "SubclassesAsync_"), flags, 5)
        this.vtbl.Associators_ := CallbackCreate(GetMethod(implObj, "Associators_"), flags, 12)
        this.vtbl.AssociatorsAsync_ := CallbackCreate(GetMethod(implObj, "AssociatorsAsync_"), flags, 13)
        this.vtbl.References_ := CallbackCreate(GetMethod(implObj, "References_"), flags, 9)
        this.vtbl.ReferencesAsync_ := CallbackCreate(GetMethod(implObj, "ReferencesAsync_"), flags, 10)
        this.vtbl.ExecMethod_ := CallbackCreate(GetMethod(implObj, "ExecMethod_"), flags, 6)
        this.vtbl.ExecMethodAsync_ := CallbackCreate(GetMethod(implObj, "ExecMethodAsync_"), flags, 7)
        this.vtbl.Clone_ := CallbackCreate(GetMethod(implObj, "Clone_"), flags, 2)
        this.vtbl.GetObjectText_ := CallbackCreate(GetMethod(implObj, "GetObjectText_"), flags, 3)
        this.vtbl.SpawnDerivedClass_ := CallbackCreate(GetMethod(implObj, "SpawnDerivedClass_"), flags, 3)
        this.vtbl.SpawnInstance_ := CallbackCreate(GetMethod(implObj, "SpawnInstance_"), flags, 3)
        this.vtbl.CompareTo_ := CallbackCreate(GetMethod(implObj, "CompareTo_"), flags, 4)
        this.vtbl.get_Qualifiers_ := CallbackCreate(GetMethod(implObj, "get_Qualifiers_"), flags, 2)
        this.vtbl.get_Properties_ := CallbackCreate(GetMethod(implObj, "get_Properties_"), flags, 2)
        this.vtbl.get_Methods_ := CallbackCreate(GetMethod(implObj, "get_Methods_"), flags, 2)
        this.vtbl.get_Derivation_ := CallbackCreate(GetMethod(implObj, "get_Derivation_"), flags, 2)
        this.vtbl.get_Path_ := CallbackCreate(GetMethod(implObj, "get_Path_"), flags, 2)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Put_)
        CallbackFree(this.vtbl.PutAsync_)
        CallbackFree(this.vtbl.Delete_)
        CallbackFree(this.vtbl.DeleteAsync_)
        CallbackFree(this.vtbl.Instances_)
        CallbackFree(this.vtbl.InstancesAsync_)
        CallbackFree(this.vtbl.Subclasses_)
        CallbackFree(this.vtbl.SubclassesAsync_)
        CallbackFree(this.vtbl.Associators_)
        CallbackFree(this.vtbl.AssociatorsAsync_)
        CallbackFree(this.vtbl.References_)
        CallbackFree(this.vtbl.ReferencesAsync_)
        CallbackFree(this.vtbl.ExecMethod_)
        CallbackFree(this.vtbl.ExecMethodAsync_)
        CallbackFree(this.vtbl.Clone_)
        CallbackFree(this.vtbl.GetObjectText_)
        CallbackFree(this.vtbl.SpawnDerivedClass_)
        CallbackFree(this.vtbl.SpawnInstance_)
        CallbackFree(this.vtbl.CompareTo_)
        CallbackFree(this.vtbl.get_Qualifiers_)
        CallbackFree(this.vtbl.get_Properties_)
        CallbackFree(this.vtbl.get_Methods_)
        CallbackFree(this.vtbl.get_Derivation_)
        CallbackFree(this.vtbl.get_Path_)
        CallbackFree(this.vtbl.get_Security_)
    }
}
