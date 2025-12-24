#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemQualifierSet.ahk
#Include .\IWbemClassObject.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Contains and manipulates both class definitions and class object instances.
 * @remarks
 * 
 * Users and providers should never implement this interface. The implementation provided by WMI is the only one 
 *      that is supported.
 * 
 * From the WMI client perspective, this interface is always in-process. Write 
 *      (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-put">Put</a>) operations only affect the local copy of the 
 *      object, and read (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-get">Get</a>) operations always retrieve 
 *      values from the local copy. You can perform updates to WMI only when entire objects are read or written using 
 *      methods on the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface. Examples of such 
 *      updates are: <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a> or 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemclassobject
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemClassObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemClassObject
     * @type {Guid}
     */
    static IID => Guid("{dc12a681-737f-11cf-884d-00aa004b2e24}")

    /**
     * The class identifier for WbemClassObject
     * @type {Guid}
     */
    static CLSID => Guid("{9a653086-174f-11d2-b5f9-00104b703efd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetQualifierSet", "Get", "Put", "Delete", "GetNames", "BeginEnumeration", "Next", "EndEnumeration", "GetPropertyQualifierSet", "Clone", "GetObjectText", "SpawnDerivedClass", "SpawnInstance", "CompareTo", "GetPropertyOrigin", "InheritsFrom", "GetMethod", "PutMethod", "DeleteMethod", "BeginMethodEnumeration", "NextMethod", "EndMethodEnumeration", "GetMethodQualifierSet", "GetMethodOrigin"]

    /**
     * The IWbemClassObject::GetQualifierSet method returns an interface pointer that allows read and write operations on the set of qualifiers for the entire class object, whether the object is an instance or a class definition.
     * @returns {IWbemQualifierSet} Receives the interface pointer that allows access to the qualifiers for the class object. The returned object has a positive reference count upon return from the call. The caller must call <b>IWbemQualifierSet::Release</b> when the object is no longer needed. This parameter cannot be <b>NULL</b>. On error, a new object is not returned and the pointer is left unmodified.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getqualifierset
     */
    GetQualifierSet() {
        result := ComCall(3, this, "ptr*", &ppQualSet := 0, "HRESULT")
        return IWbemQualifierSet(ppQualSet)
    }

    /**
     * The IWbemClassObject::Get method retrieves the specified property value, if it exists. This method can also return system properties.
     * @param {PWSTR} wszName Name of the desired property. It is treated as read-only.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<VARIANT>} pVal When successful, this parameter is assigned the correct type and value for the qualifier, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantinit">VariantInit</a> function is called on <i>pVal</i>. It is the responsibility of the caller to call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> on <i>pVal</i> when the value is not needed. If there is an error, the value that <i>pVal</i> points to is not modified. If an uninitialized <i>pVal</i> value is passed to the method, then the caller must check the return value of the method, and call <b>VariantClear</b> only when the method succeeds.
     * @param {Pointer<Integer>} pType Can be <b>NULL</b>. If it is not <b>NULL</b>, it receives the CIM type of the property, that is, one of the CIM-type constants, such as <b>CIM_SINT32</b>, <b>CIM_STRING</b>, and so on. For more information about these values, see <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-cimtype_enumeration">CIMTYPE_ENUMERATION</a>. This indicates the CIM semantics of the property value packed into <b>VARIANT</b>.
     * @param {Pointer<Integer>} plFlavor Can be <b>NULL</b>. If not <b>NULL</b>, the LONG value pointed to receives information about the origin of the property. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/qualifier-flavors">Qualifier Flavors</a> and <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_flavor_type">WBEM_FLAVOR_TYPE</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained in an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-get
     */
    Get(wszName, lFlags, pVal, pType, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", wszName, "int", lFlags, "ptr", pVal, pTypeMarshal, pType, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * Sets a named property to a new value.
     * @param {PWSTR} wszName A parameter that must point to a valid property name. This parameter cannot be <b>NULL</b>.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<VARIANT>} pVal A parameter that must point to a valid <b>VARIANT</b>, which becomes the new property value. If <i>pVal</i> is <b>NULL</b> or points to a <b>VARIANT</b> of type <b>VT_NULL</b>, the property is set to <b>NULL</b>, that is, no value.
     * @param {Integer} Type A type of <b>VARIANT</b> pointed to by <i>pVal</i>.
     * 
     * The <b>NULL</b> value for a property designated by a <b>VARIANT</b> of type <b>VT_NULL</b> is distinguished from a property of type <b>VT_I4</b> with a 0 (zero) value.
     * 
     * When creating new properties, if <i>pVal</i> is <b>NULL</b> or points to a <b>VT_NULL</b>, the type of the property is determined from the <i>vtType</i> parameter.
     * 
     * If <i>pVal</i> is to contain an embedded 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a>, the caller must call <b>IWbemClassObject::QueryInterface</b> for <b>IID_IUnknown</b> and place the resulting pointer in the <b>VARIANT</b> using a type of <b>VT_UNKNOWN</b>. The original embedded object is copied during the 
     * <b>Put</b> operation, and so cannot be modified by the operation.
     * 
     * The pointer is treated as read-only. The caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> after this call is complete.
     * 
     * Use this parameter only when creating new properties in a CIM class definition and <i>pVal</i> is <b>NULL</b> or points to a <b>VARIANT</b> of type <b>VT_NULL</b>. In such a case, the <i>vtType</i> parameter specifies the CIM type of the property. In every other case, <i>vtType</i> must be 0 (zero). Also, <i>vtType</i> must be 0 (zero) when the underlying object is an instance (even if <i>pVal</i> is <b>NULL</b>), because the type of the property is fixed and cannot be changed. In other words, use <i>vtType</i> if, and only if, <i>pVal</i> is <b>NULL</b> or points to a <b>VT_NULL</b><b>VARIANT</b>, and the underlying object is a CIM class.
     * 
     * When using 
     * <b>IWbemClassObject::Put</b> to assign empty array values to a property, you do not need to specify the exact VT type; you can assign a value to <i>pVal</i> that is a <b>VARIANT</b> with a variant type of <b>VT_ARRAY</b>|<b>VT_VARIANT</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the values contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-put
     */
    Put(wszName, lFlags, pVal, Type) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "int", lFlags, "ptr", pVal, "int", Type, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::Delete method deletes the specified property from a CIM class definition and all of its qualifiers.
     * @param {PWSTR} wszName Property name to delete. This must point to a valid <b>LPCWSTR</b>. It is treated as read-only.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-delete
     */
    Delete(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(6, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * Retrieves the names of the properties in the object.
     * @param {PWSTR} wszQualifierName A parameter that can be <b>NULL</b>. If not <b>NULL</b>, it must point to a valid <b>LPCWSTR</b> specifying a qualifier name which operates as part of a filter. This is handled as read-only. For more information, see Remarks.
     * @param {Integer} lFlags For more information, see Remarks.
     * @param {Pointer<VARIANT>} pQualifierVal A parameter that can be <b>NULL</b>. If not <b>NULL</b>, it must point to a valid <b>VARIANT</b> structure initialized to a filter value. This <b>VARIANT</b> is handled as read-only by the method. Thus, the caller must call <b>VariantClear</b> on it, if required. For more information, see Remarks.
     * @returns {Pointer<SAFEARRAY>} A parameter that cannot be <b>NULL</b>, but on entry this parameter must point to <b>NULL</b>. A new <b>SAFEARRAY</b> structure is always allocated, and the pointer is set to point to it. The returned array can have 0 elements, but is always allocated when <b>WBEM_S_NO_ERROR</b> returns. On error, a new <b>SAFEARRAY</b> structure is not returned.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getnames
     */
    GetNames(wszQualifierName, lFlags, pQualifierVal) {
        wszQualifierName := wszQualifierName is String ? StrPtr(wszQualifierName) : wszQualifierName

        result := ComCall(7, this, "ptr", wszQualifierName, "int", lFlags, "ptr", pQualifierVal, "ptr*", &pNames := 0, "HRESULT")
        return pNames
    }

    /**
     * Resets an enumeration back to the beginning of the enumeration.
     * @param {Integer} lEnumFlags Combination of flags described in Remarks.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-beginenumeration
     */
    BeginEnumeration(lEnumFlags) {
        result := ComCall(8, this, "int", lEnumFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::Next method retrieves the next property in an enumeration that started with IWbemClassObject::BeginEnumeration.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {Pointer<BSTR>} strName Receives a new <b>BSTR</b> that contains the property name. To prevent memory leaks 
     *       in the client process, the caller must call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the name is no 
     *       longer required. You can set this parameter to <b>NULL</b> if the name is not required.
     * @param {Pointer<VARIANT>} pVal This <b>VARIANT</b> is filled with the value of the property. The method calls 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantinit">VariantInit</a> on this 
     *        <b>VARIANT</b>, so the caller should ensure that the <b>VARIANT</b> 
     *        is not active prior to the call. The caller must use 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> when the value is no 
     *        longer required.
     * 
     * You can set this parameter to <b>NULL</b> if the value is not required. If an error code 
     *        is returned, the <b>VARIANT</b> pointed to by <i>pVal</i> is left 
     *        unmodified.
     * @param {Pointer<Integer>} pType This parameter can be <b>NULL</b>. If it is not <b>NULL</b>, it must 
     *       point to a <b>CIMTYPE</b> variable (a <b>LONG</b>) into which the 
     *       type of the property is placed. It is possible that the value of this property can be a 
     *       <b>VT_NULL</b> <b>VARIANT</b>, in which case it 
     *       is necessary to determine the actual type of the property.
     * @param {Pointer<Integer>} plFlavor Can be <b>NULL</b>. If not <b>NULL</b>, the 
     *        <b>LONG</b> value pointed to receives information on the origin of the property as 
     *        follows. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/qualifier-flavors">Qualifier Flavors</a> and <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_flavor_type">WBEM_FLAVOR_TYPE</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The 
     *        following list lists the value contained within an <b>HRESULT</b>. For general 
     *        <b>HRESULT</b> values, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-next
     */
    Next(lFlags, strName, pVal, pType, plFlavor) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lFlags, "ptr", strName, "ptr", pVal, pTypeMarshal, pType, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::EndEnumeration method terminates an enumeration sequence started with IWbemClassObject::BeginEnumeration.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-endenumeration
     */
    EndEnumeration() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::GetPropertyQualifierSet method gets the qualifier set for a particular property in the class object. You can use this method with properties that are a member of an instance or a class definition.
     * @param {PWSTR} wszProperty Property for which the qualifier set is requested. This cannot be <b>NULL</b> and must point to a valid <b>LPCWSTR</b>. The property can be local or propagated from the parent class. Note that system properties have no qualifiers so this method returns the error code <b>WBEM_E_SYSTEM_PROPERTY</b> if you attempt to obtain the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemqualifierset">IWbemQualifierSet</a> pointer for a system property.
     * @returns {IWbemQualifierSet} Receives an interface pointer that allows access to the qualifiers for the named property. The caller must call <b>IWbemQualifierSet::Release</b> on the pointer when access to the object is no longer required. The property is set to point to <b>NULL</b> when there are error conditions. A new object is not returned.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getpropertyqualifierset
     */
    GetPropertyQualifierSet(wszProperty) {
        wszProperty := wszProperty is String ? StrPtr(wszProperty) : wszProperty

        result := ComCall(11, this, "ptr", wszProperty, "ptr*", &ppQualSet := 0, "HRESULT")
        return IWbemQualifierSet(ppQualSet)
    }

    /**
     * The IWbemClassObject::Clone method returns a new object that is a complete clone of the current object. The new object has a COM reference count of 1.
     * @returns {IWbemClassObject} This parameter cannot be <b>NULL</b>. It receives the copy of the current object. You must call <b>IWbemClassObject::Release </b>on this object when it is no longer required.
     * 
     * A new object is not returned on error.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-clone
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &ppCopy := 0, "HRESULT")
        return IWbemClassObject(ppCopy)
    }

    /**
     * The IWbemClassObject::GetObjectText method returns a textual rendering of the object in the MOF syntax.
     * @param {Integer} lFlags Normally 0. If <b>WBEM_FLAG_NO_FLAVORS</b> is specified, qualifiers will be presented without propagation or flavor information.
     * @returns {BSTR} This must point to <b>NULL</b> on entry. This parameter receives from Windows Management a newly allocated <b>BSTR</b> that was initialized with <b>SysAllocString</b>. You must call <b>SysFreeString</b> on the pointer when the string is no longer required. This pointer points to a MOF syntax rendering of the object upon return from the call. Because this is an out parameter, the pointer must not point to a string that is valid before this method is called, because the pointer will not be deallocated.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext
     */
    GetObjectText(lFlags) {
        pstrObjectText := BSTR()
        result := ComCall(13, this, "int", lFlags, "ptr", pstrObjectText, "HRESULT")
        return pstrObjectText
    }

    /**
     * Use the IWbemClassObject::SpawnDerivedClass method to create a newly derived class object from the current object.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {IWbemClassObject} Cannot be <b>NULL</b>. This receives the pointer to the new class definition object. The caller must invoke <b>IWbemClassObject::Release</b> when the object is no longer required, typically after you have invoked 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a> to write the class definition. On error, a new object is not returned, and <i>ppNewClass</i> is left unmodified.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-spawnderivedclass
     */
    SpawnDerivedClass(lFlags) {
        result := ComCall(14, this, "int", lFlags, "ptr*", &ppNewClass := 0, "HRESULT")
        return IWbemClassObject(ppNewClass)
    }

    /**
     * Use the IWbemClassObject::SpawnInstance method to create a new instance of a class.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {IWbemClassObject} Cannot be <b>NULL</b>. It receives a new instance of the class. The caller must invoke <b>IWbemClassObject::Release</b> when the pointer is no longer required. On error, a new object is not returned and the pointer is left unmodified.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-spawninstance
     */
    SpawnInstance(lFlags) {
        result := ComCall(15, this, "int", lFlags, "ptr*", &ppNewInstance := 0, "HRESULT")
        return IWbemClassObject(ppNewInstance)
    }

    /**
     * The IWbemClassObject::CompareTo method compares an object to another Windows Management object. Note that there are certain constraints in this comparison process.
     * @param {Integer} lFlags Specifies the object characteristics to consider in comparison to another object. It can be <b>WBEM_COMPARISON_INCLUDE_ALL</b> to consider all features, or any combination of these flags.
     * @param {IWbemClassObject} pCompareTo Object in comparison. This pointer must point to a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> instance. It cannot be <b>NULL</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-compareto
     */
    CompareTo(lFlags, pCompareTo) {
        result := ComCall(16, this, "int", lFlags, "ptr", pCompareTo, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::GetPropertyOrigin method retrieves the name of the class in which a particular property was introduced.
     * @param {PWSTR} wszName Property name for which the owning class name is desired. This must point to a valid <b>LPCWSTR</b>, which is treated as read-only.
     * @returns {BSTR} Pointer to the address of a new <b>BSTR</b> that receives the parent class name. To prevent memory leaks in the client process, the caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the name is no longer required. This parameter must not point to a valid string before the method is called because this is an output parameter, and this pointer is not deallocated after the call is complete.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getpropertyorigin
     */
    GetPropertyOrigin(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pstrClassName := BSTR()
        result := ComCall(17, this, "ptr", wszName, "ptr", pstrClassName, "HRESULT")
        return pstrClassName
    }

    /**
     * The IWbemClassObject::InheritsFrom method determines if the current class or instance derives from a specified parent class.
     * @param {PWSTR} strAncestor Cannot be <b>NULL</b>. It contains the class name that is being tested. If the current object has this class for one of its ancestor classes, <b>WBEM_S_NO_ERROR</b> returns. This must point to a valid <b>LPCWSTR</b>, which is treated as read-only.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-inheritsfrom
     */
    InheritsFrom(strAncestor) {
        strAncestor := strAncestor is String ? StrPtr(strAncestor) : strAncestor

        result := ComCall(18, this, "ptr", strAncestor, "HRESULT")
        return result
    }

    /**
     * Returns information about the requested method.
     * @param {PWSTR} wszName The method name. This cannot be <b>NULL</b>, and must point to a valid <b>LPCWSTR</b>.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {Pointer<IWbemClassObject>} ppInSignature A pointer that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> pointer which describes the in parameters to the method. This parameter is  ignored if set to <b>NULL</b>. Be aware that Windows Management can set the 
     * <b>IWbemClassObject</b> pointer to <b>NULL</b> if this method has no in parameters. For more information, see Remarks.
     * @param {Pointer<IWbemClassObject>} ppOutSignature A pointer that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> pointer which describes the out-parameters to the method. This parameter will be ignored if set to <b>NULL</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getmethod
     */
    GetMethod(wszName, lFlags, ppInSignature, ppOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(19, this, "ptr", wszName, "int", lFlags, "ptr*", ppInSignature, "ptr*", ppOutSignature, "HRESULT")
        return result
    }

    /**
     * Used to create a method.
     * @param {PWSTR} wszName The method name that is  created.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {IWbemClassObject} pInSignature A pointer to a copy of the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__Parameters</a> system class that contains the in parameters for the method. This parameter is ignored if set to <b>NULL</b>.
     * @param {IWbemClassObject} pOutSignature A pointer to a copy of the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__Parameters</a> system class that contains the out parameters for the object. This parameter is ignored if set to <b>NULL</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-putmethod
     */
    PutMethod(wszName, lFlags, pInSignature, pOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(20, this, "ptr", wszName, "int", lFlags, "ptr", pInSignature, "ptr", pOutSignature, "HRESULT")
        return result
    }

    /**
     * Use the IWbemClassObject::DeleteMethod method to delete a method. This call is supported only if the current object is a CIM class definition. Method manipulation is not available from IWbemClassObject pointers which point to CIM instances.
     * @param {PWSTR} wszName Method name to be removed from the class definition.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-deletemethod
     */
    DeleteMethod(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(21, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * Use the IWbemClassObject::BeginMethodEnumeration method call to begin an enumeration of the methods available for the object.
     * @param {Integer} lEnumFlags Specifies the scope of the enumeration.
     * 
     * 
     * Possible values:
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-beginmethodenumeration
     */
    BeginMethodEnumeration(lEnumFlags) {
        result := ComCall(22, this, "int", lEnumFlags, "HRESULT")
        return result
    }

    /**
     * Used to retrieve the next method in a method enumeration sequence that starts with a call to IWbemClassObject::BeginMethodEnumeration.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<BSTR>} pstrName A pointer that should point to <b>NULL</b> prior to the call. This parameter receives the address of a <b>BSTR</b> value containing the method name. The caller must release the string using <b>SysFreeString</b> when it is no longer required.
     * @param {Pointer<IWbemClassObject>} ppInSignature A pointer that receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> containing the in parameters for the method.
     * @param {Pointer<IWbemClassObject>} ppOutSignature A pointer that receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> containing the out parameters for the method.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-nextmethod
     */
    NextMethod(lFlags, pstrName, ppInSignature, ppOutSignature) {
        result := ComCall(23, this, "int", lFlags, "ptr", pstrName, "ptr*", ppInSignature, "ptr*", ppOutSignature, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::EndMethodEnumeration method is used to terminate a method enumeration sequence started with IWbemClassObject::BeginMethodEnumeration.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>. For general <b>HRESULT</b> values, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-endmethodenumeration
     */
    EndMethodEnumeration() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * The IWbemClassObject::GetMethodQualifierSet is used to retrieve the qualifier set for a particular method.
     * @param {PWSTR} wszMethod Must point to a valid <b>LPCWSTR</b> containing the method name.
     * @returns {IWbemQualifierSet} Receives the interface pointer that allows access to the qualifiers for the method. The returned object has a positive reference count upon return from the call. The caller must call <b>IWbemQualifierSet::Release</b> when the object is no longer needed. This parameter cannot be <b>NULL</b>. On error, a new object is not returned, and the pointer is set to point to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getmethodqualifierset
     */
    GetMethodQualifierSet(wszMethod) {
        wszMethod := wszMethod is String ? StrPtr(wszMethod) : wszMethod

        result := ComCall(25, this, "ptr", wszMethod, "ptr*", &ppQualSet := 0, "HRESULT")
        return IWbemQualifierSet(ppQualSet)
    }

    /**
     * The IWbemClassObject::GetMethodOrigin method is used to determine the class for which a method was declared.
     * @param {PWSTR} wszMethodName Name of the method for the object whose owning class is being requested.
     * @returns {BSTR} Receives the name of the class which owns the method. The user must call <b>SysFreeString </b>on the returned <i>BSTR</i> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemclassobject-getmethodorigin
     */
    GetMethodOrigin(wszMethodName) {
        wszMethodName := wszMethodName is String ? StrPtr(wszMethodName) : wszMethodName

        pstrClassName := BSTR()
        result := ComCall(26, this, "ptr", wszMethodName, "ptr", pstrClassName, "HRESULT")
        return pstrClassName
    }
}
