#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Acts as a container for the entire set of named qualifiers for a single property or entire object (a class or instance).
 * @remarks
 * 
 * It is strongly recommended that Windows Management dynamic providers never implement this interface because  WMI provides the implementation. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a>.
 * 
 * Within WMI, this interface is always in-process. Put operations only affect the local copy of the object. Get operations retrieve values from the local copy. Updates are performed only when entire objects are read or written using methods on the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemqualifierset
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemQualifierSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemQualifierSet
     * @type {Guid}
     */
    static IID => Guid("{dc12a680-737f-11cf-884d-00aa004b2e24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get", "Put", "Delete", "GetNames", "BeginEnumeration", "Next", "EndEnumeration"]

    /**
     * The IWbemQualifierSet::Get method gets the specified named qualifier, if found.
     * @param {PWSTR} wszName Name of the qualifier for which the value is being requested. The pointer is treated as read-only.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {Pointer<VARIANT>} pVal When successful, <b>VARIANT</b> is assigned to the correct type and value for the qualifier. <b>VariantInit</b> is called on this <b>VARIANT</b>.
     * 
     * It is the responsibility of the caller to call <b>VariantClear</b> on the pointer when the value is no longer required. If there is an error code, the <b>VARIANT</b> pointed to by <i>pVal</i> is not modified.
     * 
     * If this parameter is <b>NULL</b>, the parameter is ignored.
     * @param {Pointer<Integer>} plFlavor Can be <b>NULL</b>. If not <b>NULL</b>, this must point to a <b>LONG</b> that receives the qualifier flavor bits for the requested qualifier. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/qualifier-flavors">Qualifier Flavors</a> and <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_flavor_type">WBEM_FLAVOR_TYPE</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-get
     */
    Get(wszName, lFlags, pVal, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", wszName, "int", lFlags, "ptr", pVal, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * The IWbemQualifierSet::Put method writes the named qualifier and value. The new qualifier overwrites the previous value of the same name. If the qualifier does not exist, it is created.
     * @param {PWSTR} wszName Name of the qualifier that is being written. The pointer is treated as read-only.
     * @param {Pointer<VARIANT>} pVal Cannot be <b>NULL</b>. This must point to a valid <b>VARIANT</b> that contains the qualifier value to be written. The pointer is treated as read-only. It is the caller's responsibility to call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> on this pointer after the value is not required.
     * 
     * Only variants and arrays of type <b>VT_I4</b>, <b>VT_R8</b>, <b>VT_BSTR</b>, <b>VT_BOOL</b> are supported.
     * @param {Integer} lFlavor Desired qualifier flavors for this qualifier.  The following list lists the appropriate constants for <i>lFlavor</i>. The default value is zero (0).
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-put
     */
    Put(wszName, pVal, lFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(4, this, "ptr", wszName, "ptr", pVal, "int", lFlavor, "HRESULT")
        return result
    }

    /**
     * The IWbemQualifierSet::Delete method deletes the specified qualifier by name.
     * @param {PWSTR} wszName Name of the qualifier to delete. The pointer is treated as read-only.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-delete
     */
    Delete(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * The IWbemQualifierSet::GetNames method retrieves the names of all of the qualifiers available from the current object or property. Alternately, depending on the filter value of IFlags, this method retrieves the names of certain qualifiers.
     * @param {Integer} lFlags One of the following constants.
     * @returns {Pointer<SAFEARRAY>} A new <b>SAFEARRAY</b> is created that contains the requested names.
     * 
     * In all cases where no error is returned, a new array is created and <i>pstrNames</i> is set to point to it. This occurs even though the resulting array has zero elements. On error, a new <b>SAFEARRAY</b> is not returned.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-getnames
     */
    GetNames(lFlags) {
        result := ComCall(6, this, "int", lFlags, "ptr*", &pNames := 0, "HRESULT")
        return pNames
    }

    /**
     * The IWbemQualifierSet::BeginEnumeration method resets before there is an enumeration of all the qualifiers in the object.
     * @param {Integer} lFlags Specifies the qualifiers to include in the enumeration. It must be one of the following constants.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-beginenumeration
     */
    BeginEnumeration(lFlags) {
        result := ComCall(7, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemQualifierSet::Next method retrieves the next qualifier in an enumeration that started with IWbemQualifierSet::BeginEnumeration.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<BSTR>} pstrName This parameter receives the name of the qualifier. A new <b>BSTR</b> is always allocated whenever <b>WBEM_S_NO_ERROR</b> returns.
     * 
     * If <i>pstrName</i> is <b>NULL</b>, it is ignored; otherwise, the caller must ensure that this parameter does not point to a valid <b>BSTR</b> on entry, or else there will be a memory leak. Also, the caller must remember to call <b>SysFreeString</b> on the returned string when it is no longer required.
     * @param {Pointer<VARIANT>} pVal This parameter receives the value for the qualifier. <b>VariantInit</b> is called on the <b>VARIANT</b> by this method. The caller must call <b>VariantClear</b> on this pointer when the value is no longer required. If an error code is returned, the <b>VARIANT</b> pointed to by <i>pVal</i> is left unmodified. This parameter is ignored if set to <b>NULL</b>.
     * @param {Pointer<Integer>} plFlavor If not <b>NULL</b>, the value pointed to is set to the qualifier flavor. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/qualifier-flavors">Qualifier Flavors</a> and <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_flavor_type">WBEM_FLAVOR_TYPE</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-next
     */
    Next(lFlags, pstrName, pVal, plFlavor) {
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lFlags, "ptr", pstrName, "ptr", pVal, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * Call the IWbemQualifierSet::EndEnumeration method when you plan to terminate enumerations initiated with IWbemQualifierSet::BeginEnumeration and IWbemQualifierSet::Next.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemqualifierset-endenumeration
     */
    EndEnumeration() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
