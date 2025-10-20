#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObject extends IDispatch{
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
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectPath>} objWbemObjectPath 
     * @returns {HRESULT} 
     */
    Put_(iFlags, objWbemNamedValueSet, objWbemObjectPath) {
        result := ComCall(7, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    PutAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(8, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Delete_(iFlags, objWbemNamedValueSet) {
        result := ComCall(9, this, "int", iFlags, "ptr", objWbemNamedValueSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    DeleteAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(10, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectSet>} objWbemObjectSet 
     * @returns {HRESULT} 
     */
    Instances_(iFlags, objWbemNamedValueSet, objWbemObjectSet) {
        result := ComCall(11, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    InstancesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(12, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectSet>} objWbemObjectSet 
     * @returns {HRESULT} 
     */
    Subclasses_(iFlags, objWbemNamedValueSet, objWbemObjectSet) {
        result := ComCall(13, this, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    SubclassesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(14, this, "ptr", objWbemSink, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectSet>} objWbemObjectSet 
     * @returns {HRESULT} 
     */
    Associators_(strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemObjectSet) {
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(15, this, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {BSTR} strAssocClass 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strResultRole 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredAssocQualifier 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    AssociatorsAsync_(objWbemSink, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(16, this, "ptr", objWbemSink, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectSet>} objWbemObjectSet 
     * @returns {HRESULT} 
     */
    References_(strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemObjectSet) {
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(17, this, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ReferencesAsync_(objWbemSink, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(18, this, "ptr", objWbemSink, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strMethodName 
     * @param {Pointer<IDispatch>} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObject>} objWbemOutParameters 
     * @returns {HRESULT} 
     */
    ExecMethod_(strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet, objWbemOutParameters) {
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(19, this, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemOutParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemSink 
     * @param {BSTR} strMethodName 
     * @param {Pointer<IDispatch>} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecMethodAsync_(objWbemSink, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(20, this, "ptr", objWbemSink, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemObject>} objWbemObject 
     * @returns {HRESULT} 
     */
    Clone_(objWbemObject) {
        result := ComCall(21, this, "ptr", objWbemObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<BSTR>} strObjectText 
     * @returns {HRESULT} 
     */
    GetObjectText_(iFlags, strObjectText) {
        result := ComCall(22, this, "int", iFlags, "ptr", strObjectText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemObject>} objWbemObject 
     * @returns {HRESULT} 
     */
    SpawnDerivedClass_(iFlags, objWbemObject) {
        result := ComCall(23, this, "int", iFlags, "ptr", objWbemObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemObject>} objWbemObject 
     * @returns {HRESULT} 
     */
    SpawnInstance_(iFlags, objWbemObject) {
        result := ComCall(24, this, "int", iFlags, "ptr", objWbemObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} objWbemObject 
     * @param {Integer} iFlags 
     * @param {Pointer<VARIANT_BOOL>} bResult 
     * @returns {HRESULT} 
     */
    CompareTo_(objWbemObject, iFlags, bResult) {
        result := ComCall(25, this, "ptr", objWbemObject, "int", iFlags, "ptr", bResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemQualifierSet>} objWbemQualifierSet 
     * @returns {HRESULT} 
     */
    get_Qualifiers_(objWbemQualifierSet) {
        result := ComCall(26, this, "ptr", objWbemQualifierSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemPropertySet>} objWbemPropertySet 
     * @returns {HRESULT} 
     */
    get_Properties_(objWbemPropertySet) {
        result := ComCall(27, this, "ptr", objWbemPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemMethodSet>} objWbemMethodSet 
     * @returns {HRESULT} 
     */
    get_Methods_(objWbemMethodSet) {
        result := ComCall(28, this, "ptr", objWbemMethodSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} strClassNameArray 
     * @returns {HRESULT} 
     */
    get_Derivation_(strClassNameArray) {
        result := ComCall(29, this, "ptr", strClassNameArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemObjectPath>} objWbemObjectPath 
     * @returns {HRESULT} 
     */
    get_Path_(objWbemObjectPath) {
        result := ComCall(30, this, "ptr", objWbemObjectPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemSecurity>} objWbemSecurity 
     * @returns {HRESULT} 
     */
    get_Security_(objWbemSecurity) {
        result := ComCall(31, this, "ptr", objWbemSecurity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
