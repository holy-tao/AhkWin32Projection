#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemObjectSet.ahk" { ISWbemObjectSet }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import ".\ISWbemEventSource.ahk" { ISWbemEventSource }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemServices extends IDispatch {
    /**
     * The interface identifier for ISWbemServices
     * @type {Guid}
     */
    static IID := Guid("{76a6415c-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemServices
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d63-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemServices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Get                        : IntPtr
        GetAsync                   : IntPtr
        Delete                     : IntPtr
        DeleteAsync                : IntPtr
        InstancesOf                : IntPtr
        InstancesOfAsync           : IntPtr
        SubclassesOf               : IntPtr
        SubclassesOfAsync          : IntPtr
        ExecQuery                  : IntPtr
        ExecQueryAsync             : IntPtr
        AssociatorsOf              : IntPtr
        AssociatorsOfAsync         : IntPtr
        ReferencesTo               : IntPtr
        ReferencesToAsync          : IntPtr
        ExecNotificationQuery      : IntPtr
        ExecNotificationQueryAsync : IntPtr
        ExecMethod                 : IntPtr
        ExecMethodAsync            : IntPtr
        get_Security_              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObject} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(strObjectPath, iFlags, objWbemNamedValueSet) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(7, this, BSTR, strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    GetAsync(objWbemSink, strObjectPath, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(8, this, "ptr", objWbemSink, BSTR, strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Delete(strObjectPath, iFlags, objWbemNamedValueSet) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(9, this, BSTR, strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    DeleteAsync(objWbemSink, strObjectPath, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(10, this, "ptr", objWbemSink, BSTR, strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    InstancesOf(strClass, iFlags, objWbemNamedValueSet) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(11, this, BSTR, strClass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strClass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    InstancesOfAsync(objWbemSink, strClass, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(12, this, "ptr", objWbemSink, BSTR, strClass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strSuperclass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    SubclassesOf(strSuperclass, iFlags, objWbemNamedValueSet) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(13, this, BSTR, strSuperclass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strSuperclass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    SubclassesOfAsync(objWbemSink, strSuperclass, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(14, this, "ptr", objWbemSink, BSTR, strSuperclass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    ExecQuery(strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet) {
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage

        result := ComCall(15, this, BSTR, strQuery, BSTR, strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} lFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecQueryAsync(objWbemSink, strQuery, strQueryLanguage, lFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage

        result := ComCall(16, this, "ptr", objWbemSink, BSTR, strQuery, BSTR, strQueryLanguage, "int", lFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
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
    AssociatorsOf(strObjectPath, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(17, this, BSTR, strObjectPath, BSTR, strAssocClass, BSTR, strResultClass, BSTR, strResultRole, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredAssocQualifier, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
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
    AssociatorsOfAsync(objWbemSink, strObjectPath, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strAssocClass := strAssocClass is String ? BSTR.Alloc(strAssocClass).Value : strAssocClass
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strResultRole := strResultRole is String ? BSTR.Alloc(strResultRole).Value : strResultRole
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredAssocQualifier := strRequiredAssocQualifier is String ? BSTR.Alloc(strRequiredAssocQualifier).Value : strRequiredAssocQualifier
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(18, this, "ptr", objWbemSink, BSTR, strObjectPath, BSTR, strAssocClass, BSTR, strResultClass, BSTR, strResultRole, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredAssocQualifier, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    ReferencesTo(strObjectPath, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(19, this, BSTR, strObjectPath, BSTR, strResultClass, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
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
    ReferencesToAsync(objWbemSink, strObjectPath, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strResultClass := strResultClass is String ? BSTR.Alloc(strResultClass).Value : strResultClass
        strRole := strRole is String ? BSTR.Alloc(strRole).Value : strRole
        strRequiredQualifier := strRequiredQualifier is String ? BSTR.Alloc(strRequiredQualifier).Value : strRequiredQualifier

        result := ComCall(20, this, "ptr", objWbemSink, BSTR, strObjectPath, BSTR, strResultClass, BSTR, strRole, VARIANT_BOOL, bClassesOnly, VARIANT_BOOL, bSchemaOnly, BSTR, strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemEventSource} 
     */
    ExecNotificationQuery(strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet) {
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage

        result := ComCall(21, this, BSTR, strQuery, BSTR, strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemEventSource := 0, "HRESULT")
        return ISWbemEventSource(objWbemEventSource)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecNotificationQueryAsync(objWbemSink, strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage

        result := ComCall(22, this, "ptr", objWbemSink, BSTR, strQuery, BSTR, strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObject} 
     */
    ExecMethod(strObjectPath, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(23, this, BSTR, strObjectPath, BSTR, strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemOutParameters := 0, "HRESULT")
        return ISWbemObject(objWbemOutParameters)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecMethodAsync(objWbemSink, strObjectPath, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(24, this, "ptr", objWbemSink, BSTR, strObjectPath, BSTR, strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(25, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    Query(iid) {
        if (ISWbemServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 5)
        this.vtbl.GetAsync := CallbackCreate(GetMethod(implObj, "GetAsync"), flags, 6)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 4)
        this.vtbl.DeleteAsync := CallbackCreate(GetMethod(implObj, "DeleteAsync"), flags, 6)
        this.vtbl.InstancesOf := CallbackCreate(GetMethod(implObj, "InstancesOf"), flags, 5)
        this.vtbl.InstancesOfAsync := CallbackCreate(GetMethod(implObj, "InstancesOfAsync"), flags, 6)
        this.vtbl.SubclassesOf := CallbackCreate(GetMethod(implObj, "SubclassesOf"), flags, 5)
        this.vtbl.SubclassesOfAsync := CallbackCreate(GetMethod(implObj, "SubclassesOfAsync"), flags, 6)
        this.vtbl.ExecQuery := CallbackCreate(GetMethod(implObj, "ExecQuery"), flags, 6)
        this.vtbl.ExecQueryAsync := CallbackCreate(GetMethod(implObj, "ExecQueryAsync"), flags, 7)
        this.vtbl.AssociatorsOf := CallbackCreate(GetMethod(implObj, "AssociatorsOf"), flags, 13)
        this.vtbl.AssociatorsOfAsync := CallbackCreate(GetMethod(implObj, "AssociatorsOfAsync"), flags, 14)
        this.vtbl.ReferencesTo := CallbackCreate(GetMethod(implObj, "ReferencesTo"), flags, 10)
        this.vtbl.ReferencesToAsync := CallbackCreate(GetMethod(implObj, "ReferencesToAsync"), flags, 11)
        this.vtbl.ExecNotificationQuery := CallbackCreate(GetMethod(implObj, "ExecNotificationQuery"), flags, 6)
        this.vtbl.ExecNotificationQueryAsync := CallbackCreate(GetMethod(implObj, "ExecNotificationQueryAsync"), flags, 7)
        this.vtbl.ExecMethod := CallbackCreate(GetMethod(implObj, "ExecMethod"), flags, 7)
        this.vtbl.ExecMethodAsync := CallbackCreate(GetMethod(implObj, "ExecMethodAsync"), flags, 8)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.GetAsync)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.DeleteAsync)
        CallbackFree(this.vtbl.InstancesOf)
        CallbackFree(this.vtbl.InstancesOfAsync)
        CallbackFree(this.vtbl.SubclassesOf)
        CallbackFree(this.vtbl.SubclassesOfAsync)
        CallbackFree(this.vtbl.ExecQuery)
        CallbackFree(this.vtbl.ExecQueryAsync)
        CallbackFree(this.vtbl.AssociatorsOf)
        CallbackFree(this.vtbl.AssociatorsOfAsync)
        CallbackFree(this.vtbl.ReferencesTo)
        CallbackFree(this.vtbl.ReferencesToAsync)
        CallbackFree(this.vtbl.ExecNotificationQuery)
        CallbackFree(this.vtbl.ExecNotificationQueryAsync)
        CallbackFree(this.vtbl.ExecMethod)
        CallbackFree(this.vtbl.ExecMethodAsync)
        CallbackFree(this.vtbl.get_Security_)
    }
}
