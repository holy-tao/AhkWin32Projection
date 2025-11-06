#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemObjectPath.ahk
#Include .\ISWbemObjectSet.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemQualifierSet.ahk
#Include .\ISWbemPropertySet.ahk
#Include .\ISWbemMethodSet.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemObject
     * @type {Guid}
     */
    static IID => Guid("{76a6415a-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemObject
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d62-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Put_", "PutAsync_", "Delete_", "DeleteAsync_", "Instances_", "InstancesAsync_", "Subclasses_", "SubclassesAsync_", "Associators_", "AssociatorsAsync_", "References_", "ReferencesAsync_", "ExecMethod_", "ExecMethodAsync_", "Clone_", "GetObjectText_", "SpawnDerivedClass_", "SpawnInstance_", "CompareTo_", "get_Qualifiers_", "get_Properties_", "get_Methods_", "get_Derivation_", "get_Path_", "get_Security_"]

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

        result := ComCall(15, this, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
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

        result := ComCall(16, this, "ptr", objWbemSink, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
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

        result := ComCall(17, this, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
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

        result := ComCall(18, this, "ptr", objWbemSink, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
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

        result := ComCall(19, this, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemOutParameters := 0, "HRESULT")
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

        result := ComCall(20, this, "ptr", objWbemSink, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
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
        strObjectText := BSTR()
        result := ComCall(22, this, "int", iFlags, "ptr", strObjectText, "HRESULT")
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
        result := ComCall(25, this, "ptr", objWbemObject, "int", iFlags, "short*", &bResult := 0, "HRESULT")
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
        result := ComCall(29, this, "ptr", strClassNameArray, "HRESULT")
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
}
