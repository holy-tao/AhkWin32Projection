#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADs interface defines the basic object features, that is, properties and methods, of any ADSI object.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iads
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADs
     * @type {Guid}
     */
    static IID => Guid("{fd8256d0-fd15-11ce-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Class", "get_GUID", "get_ADsPath", "get_Parent", "get_Schema", "GetInfo", "SetInfo", "Get", "Put", "GetEx", "PutEx", "GetInfoEx"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * @type {BSTR} 
     */
    GUID {
        get => this.get_GUID()
    }

    /**
     * @type {BSTR} 
     */
    ADsPath {
        get => this.get_ADsPath()
    }

    /**
     * @type {BSTR} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    Schema {
        get => this.get_Schema()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Class() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GUID() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ADsPath() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Parent() {
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Schema() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * Loads into the property cache values of the supported properties of this ADSI object from the underlying directory store.
     * @remarks
     * The <b>IADs::GetInfo</b> function is called to initialize or refresh the property cache. This is similar to obtaining those property values of supported properties from the underlying directory store.
     * 
     * An uninitialized property cache is not necessarily empty. Call  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-putex">IADs::PutEx</a> to place a value into the property cache for any supported property and the cache remains uninitialized.
     * 
     * An explicit call to <b>IADs::GetInfo</b> loads or reloads the entire property cache, overwriting all the cached property values. But an implicit call loads only those properties not set in the cache. Always call <b>IADs::GetInfo</b> explicitly to retrieve the most current property values of the ADSI object.
     * 
     * Because an explicit call to <b>IADs::GetInfo</b> overwrites all the values in the property cache, any change made to the cache will be lost if an  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> was not invoked before <b>IADs::GetInfo</b>.
     * 
     * For an ADSI container object, <b>IADs::GetInfo</b> caches only the property values of the container, but not those of the child objects.
     * 
     * It is important to emphasize the differences between the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs::Get</a> and <b>IADs::GetInfo</b> methods. The former returns values of a given property from the property cache whereas the latter loads all the supported property values into the property cache from the underlying directory store.
     * 
     * The following code example illustrates the differences between the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs::Get</a> and <b>IADs::GetInfo</b> methods.
     * 
     * 
     * ```vb
     * Set x = GetObject("LDAP://CN=Administrator,CN=Users,DC=Fabrikam,DC=com")
     *                                      ' The first IADs::Get calls
     *                                      ' GetInfo implicitly.
     * Debug.Print x.Get("homePhone")       ' Assume value is '999-9999'. 
     * x.Put "homePhone", "868-4449"        ' Put with no commit(SetInfo)
     * Debug.Print x.Get("homePhone")       ' Value='868-4449' from the cache.
     * x.GetInfo                            ' Refresh the cache, get the data 
     *                                      ' from the directory.
     * Debug.Print x.Get("homePhone")       ' Value will be '999-9999'.
     * ```
     * 
     * 
     * For increased performance, explicitly call <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfoex">IADs::GetInfoEx</a> to refresh specific properties. Also, <b>IADs::GetInfoEx</b> 
     * must be called instead of <b>IADs::GetInfo</b> if the object's operational property values have to be accessed. This function overwrites any previously cached values of the specified properties.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-getinfo
     */
    GetInfo() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IADs::SetInfo method saves the cached property values of the ADSI object to the underlying directory store.
     * @remarks
     * It is important to emphasize the differences between the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> and <b>IADs::SetInfo</b> methods. The former sets (or modifies) values of a given property in the property cache whereas the latter propagates the changes from the property cache into the underlying directory store. Therefore, any property value changes made by <b>IADs::Put</b> will be lost if <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfoex">IADs::GetInfoEx</a>) is invoked before <b>IADs::SetInfo</b> is called.
     * 
     * Because <b>IADs::SetInfo</b> sends data across networks, minimize the usage of this method. This reduces the number of trips  a client makes to the server. For example, you should commit all, or most, of the changes to the properties from the cache to the persistent store in one batch.
     * 
     * This guideline pertains only to the relationship of <b>IADs::SetInfo</b> with the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> method, which differs from the relationship with the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-putex">IADs::PutEx</a> method.
     * 
     * The following code example illustrates the recommended  relation between <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> and <b>IADs::SetInfo</b>.
     * 
     * 
     * ```vb
     * Dim obj as IADs
     *  
     * obj.Put(prop1,val1)
     * obj.Put(prop2.val2)
     * obj.Put(prop3.val3)
     * obj.SetInfo
     * ```
     * 
     * 
     * The following code example illustrates what is not recommended between <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> and <b>IADs::SetInfo</b>.
     * 
     * 
     * ```vb
     * obj.Put(prop1,val1)
     * obj.SetInfo
     * obj.Put(prop2.val2)
     * obj.SetInfo
     * obj.Put(prop3.val3)
     * obj.SetInfo
     * ```
     * 
     * 
     * When used with  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-putex">IADs::PutEx</a>, <b>IADs::SetInfo</b> passes the operational requests specified by control codes, such as ADS_PROPERTY_UPDATE or ADS_PROPERTY_CLEAR, to the underlying directory store.
     * @returns {HRESULT} This method supports the standard return values, including S_OK for a successful operation. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-setinfo
     */
    SetInfo() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a property of a given name from the property cache.
     * @remarks
     * The <b>IADs::Get</b> method requires the caller to handle the single- and multi-valued property values differently. Thus, if you know that the property of interest is either single- or multi-valued, use the <b>IADs::Get</b> method to retrieve the property value. The following code example shows how you, as a caller, can handle single- and multi-valued properties when calling this method.
     * 
     * When a property is uninitialized, calling this method invokes an implicit call to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a> method. This loads from the underlying directory store the values of the supported properties that have not been set in the cache. Any subsequent calls to <b>IADs::Get</b> deals with property values in the cache only. For more information about the behavior of implicit and explicit calls to <b>IADs::GetInfo</b>, see <b>IADs::GetInfo</b>.
     * 
     * You can also use  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getex">IADs::GetEx</a> to retrieve property values from the property cache. However, the values are returned as a variant array of <b>VARIANT</b>s, regardless of whether they are single-valued or multi-valued. That is,  ADSI attempts to package the returned property values in consistent data formats. This saves you, as a caller, the effort of validating the data types when unsure that the returned data has single or multiple values.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the value of the property. For a multi-valued property, <i>pvProp</i> is a variant array of <b>VARIANT</b>, unless the property is a binary type. In this latter case, <i>pvProp</i> is a variant array of bytes (VT_U1 or VT_ARRAY). For the property that refers to an object, <i>pvProp</i> is a VT_DISPATCH pointer to the object referred to.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-get
     */
    Get(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pvProp := VARIANT()
        result := ComCall(15, this, "ptr", bstrName, "ptr", pvProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvProp
    }

    /**
     * Sets the values of an attribute in the ADSI attribute cache.
     * @remarks
     * The assignment of the new property values, performed by <b>Put</b> takes place in the property cache only. To propagate the changes to the directory store, call  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> on the object after calling <b>Put</b>.
     * 
     * To manipulate the property values beyond a simple assignment, use  <b>Put</b> to append  or remove a value from an existing array of attribute values.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @param {VARIANT} vProp Contains a <b>VARIANT</b> that specifies the new values of the property.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-put
     */
    Put(bstrName, vProp) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrName, "ptr", vProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves, from the property cache, property values of a given attribute.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs::Get</a> and <b>IADs::GetEx</b> methods return a different variant structure for a single-valued property value. If the property is a string, <b>IADs::Get</b> returns a variant of string (VT_BSTR), whereas <b>IADs::GetEx</b> returns a variant array of a <b>VARIANT</b> type string with a single element. Thus, if you are not sure that a multi-valued attribute will return a single value or multiple values, use <b>IADs::GetEx</b>. As it does not require you to validate the result's data structures, you may want to use <b>IADs::GetEx</b> to retrieve a property when you are not sure whether it has single or multiple values. The following list compares the two methods.
     * 
     * <table>
     * <tr>
     * <th>IADs::Get version</th>
     * <th>IADs::GetEx version</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * ```vb
     * Dim x as IADs
     * 
     * otherNumbers = x.Get("otherHomePhone")
     * If VarType(otherNumbers) = vbString Then
     *   Debug.Print otherNumbers
     * Else
     *   For Each homeNum In otherNumbers
     *     Debug.Print homeNum
     *   Next
     * End If
     * ```
     * 
     * 
     * </td>
     * <td>
     * 
     * ```cpp
     * Dim x as IADs
     * 
     * otherNumbers = x.GetEx("otherHomePhone")
     * For Each homeNum In otherNumbers
     *   Debug.Print homeNum
     * Next
     * ```
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Like the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs::Get</a> method, <b>IADs::GetEx</b> implicitly calls <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a> against an uninitialized property cache. For more information about implicit and explicit calls to <b>IADs::GetInfo</b>, see   <b>IADs::GetInfo</b>.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the value, or values, of the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-getex
     */
    GetEx(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pvProp := VARIANT()
        result := ComCall(17, this, "ptr", bstrName, "ptr", pvProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvProp
    }

    /**
     * Modifies the values of an attribute in the ADSI attribute cache.
     * @remarks
     * <b>PutEx</b> is usually used to set values on multi-value attributes. Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs::Put</a> method, with <b>PutEx</b>, you are not required to get the attribute values before you modify them. However, because <b>PutEx</b> only makes changes to attributes values contained in the ADSI property cache, you must use <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> after each <b>PutEx</b> call in order to commit changes to the directory.
     * 
     * <b>PutEx</b> enables you to append values to an existing set of values in a multi-value attribute using <b>ADS_PROPERTY_APPEND</b>. When you update, append, or delete values to a multi-value attribute, you must use an array.
     * 
     * Active Directory does not accept duplicate values on a multi-valued attribute. If you call <b>PutEx</b> to append a duplicate value to a multi-valued attribute of an Active  Directory object, the <b>PutEx</b> call succeeds, but the duplicate value is ignored.
     * 
     * Similarly, if you use <b>PutEx</b> to delete one or more values from a multi-valued property of an Active Directory object, the operation succeeds, that is, it will not produce an error, even if any or all of the specified values are not set on the property.
     * 
     * <div class="alert"><b>Note</b>  The WinNT provider ignores the value passed by the <i>InControlCode</i> argument and performs the equivalent of an <b>ADS_PROPERTY_UPDATE</b> request when using <b>PutEx</b>.</div>
     * <div> </div>
     * @param {Integer} lnControlCode Control code that  indicates the mode of modification: Append, Replace, Remove, and Delete. For more information and a list of values, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_property_operation_enum">ADS_PROPERTY_OPERATION_ENUM</a>.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @param {VARIANT} vProp Contains a <b>VARIANT</b> array that contains the new value or values of the property. A single-valued property is represented as an array with a single element. If <i>InControlCode</i> is set to <b>ADS_PROPERTY_CLEAR</b>, the value of the property specified by <i>vProp</i> is irrelevant.
     * @returns {HRESULT} This method supports  standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-putex
     */
    PutEx(lnControlCode, bstrName, vProp) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(18, this, "int", lnControlCode, "ptr", bstrName, "ptr", vProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IADs::GetInfoEx method loads the values of specified properties of the ADSI object from the underlying directory store into the property cache.
     * @remarks
     * The <b>IADs::GetInfoEx</b> method overwrites any previously cached values of the specified properties with those in the directory store. Therefore, any change made to the cache will be lost if <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a> was not invoked before the call to <b>IADs::GetInfoEx</b>.
     * 
     * Use <b>IADs::GetInfoEx</b> to refresh values of the selected property in the property cache of an ADSI object. Use <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a> to refresh all the property values.
     * 
     * For an ADSI container object, <b>IADs::GetInfoEx</b> caches only the property values of the container, but not those of the child objects.
     * @param {VARIANT} vProperties Array of null-terminated Unicode string entries that list the properties to load into the Active Directory property cache. Each property name must match one in this object's schema class definition.
     * @param {Integer} lnReserved Reserved for future use. Must be set to zero.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iads-getinfoex
     */
    GetInfoEx(vProperties, lnReserved) {
        result := ComCall(19, this, "ptr", vProperties, "int", lnReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
