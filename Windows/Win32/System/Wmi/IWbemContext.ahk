#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemContext.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemContext interface is optionally used to communicate additional context information to providers when submitting IWbemServices calls to WMI. All primary calls in IWbemServices take an optional parameter pointing to an object of this type.
 * @remarks
 * 
 * Often, dynamic providers require more information than is specified in the normal parameters of an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> method. For example, to manipulate any WMI schema objects that it provides, a provider may need to know a Simple Network Management Protocol (SNMP) community name, or a Structured Query Language (SQL) database and table name. A client can add this information to an 
 * <b>IWbemContext</b> object and send the 
 * <b>IWbemContext</b> object along with the call as one of the parameters.
 * 
 * Providers should use content objects sparingly. It is recommended that it is never required. If a provider requires a large amount of highly specific context information to respond to a request, then all clients must be coded to provide this information, thus breaking the uniform access model that is the basis of WMI. Nevertheless, in some cases it cannot be avoided. Therefore, this mechanism is provided to make it possible to access such providers. Developers of such providers should provide adequate documentation so that developers of client software can successfully manipulate such CIM objects.
 * 
 * Providers that support the use of 
 * <b>IWbemContext</b> to allow clients to specify more information in a request should restrict the types of values they support to the types in the following list:
 * 
 * <ul>
 * <li><b>VT_I4</b></li>
 * <li><b>VT_R8</b></li>
 * <li><b>VT_BOOL</b></li>
 * <li><b>VT_BSTR</b></li>
 * <li><b>VT_UNKNOW</b>N</li>
 * <li>Any of the above combined with <b>VT_ARRAY</b></li>
 * </ul>
 * <div class="alert"><b>Note</b>  Only objects that support 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> can marshal their <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> methods in an 
 * <b>IWbemContext</b> instance using a variant of type <b>VT_UNKNOWN</b>.</div>
 * <div> </div>
 * An 
 * <b>IWbemContext</b> object, which is created using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>, is a simple container of named values. Access these methods to fill in  context information required by a dynamic provider. After the call to one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> methods, the 
 * <b>IWbemContext</b> object can be reused for another call, or it can be deallocated using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> and another object created for other calls to 
 * <b>IWbemServices</b> methods.
 * 
 * The information contained in an 
 * <b>IWbemContext</b> object is entirely determined by the underlying provider. WMI does not use the information, but forwards it to the provider. Providers must publish the context information they require for these service requests.
 * 
 * The client application calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a> to create a single context object. Then, it calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcontext-setvalue">SetValue</a> one or more times to set up context values for the provider. Finally, it submits the object to one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> methods, which immediately calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the context object after the call has returned. The other methods are for use primarily by providers that receive the context object and have to extract information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemcontext
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemContext
     * @type {Guid}
     */
    static IID => Guid("{44aca674-e8fc-11d0-a07c-00c04fb68820}")

    /**
     * The class identifier for WbemContext
     * @type {Guid}
     */
    static CLSID => Guid("{674b6698-ee92-11d0-ad71-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "GetNames", "BeginEnumeration", "Next", "EndEnumeration", "SetValue", "GetValue", "DeleteValue", "DeleteAll"]

    /**
     * The IWbemContext::Clone method makes a logical copy of the current IWbemContext object. This method can be useful when many calls must be made which have largely identical IWbemContext objects.
     * @returns {IWbemContext} Must point to <b>NULL</b> on entry. It receives a pointer to the new object containing the clone of the current object. The returned pointer has a positive reference count. The caller must call <b>IWbemServices::Release</b> on this pointer when it is no longer needed. On error, this pointer is left unmodified, and a new object is not returned.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppNewCopy := 0, "HRESULT")
        return IWbemContext(ppNewCopy)
    }

    /**
     * The IWbemContext::GetNames method returns a SAFEARRAY structure of all of the names of the named context values.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {Pointer<SAFEARRAY>} This parameter cannot be <b>NULL</b>, but on entry it must point to <b>NULL</b>. If no error is returned, on exit <i>pstrNames</i> receives a pointer to a new <b>SAFEARRAY</b> structure of type VT_BSTR containing all the context value names. The caller must call <b>SafeArrayDestroy</b> on the returned pointer when the array is no longer required. If an error code is returned, the pointer is left unmodified.
     * 
     * <div class="alert"><b>Note</b>  If there are no named values in the object, the call succeeds and returns an array of length 0.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-getnames
     */
    GetNames(lFlags) {
        result := ComCall(4, this, "int", lFlags, "ptr*", &pNames := 0, "HRESULT")
        return pNames
    }

    /**
     * The IWbemContext::BeginEnumeration method resets the enumeration of all the context values in the object.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>HRESULT indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-beginenumeration
     */
    BeginEnumeration(lFlags) {
        result := ComCall(5, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemContext::Next method retrieves the next value in an enumeration of all context values beginning with IWbemContext::BeginEnumeration.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {Pointer<BSTR>} pstrName This parameter cannot be <b>NULL</b>. The pointer must not point to an active <b>BSTR</b> on entry, and ideally it should be set to point to <b>NULL</b>. If no error code is returned, it is set to point to a newly allocated <b>BSTR</b> containing the context value name.
     * 
     * The caller must call <b>SysFreeString</b> on the returned string when it is no longer required. If <b>WBEM_S_NO_MORE_DATA</b> returns, <i>pstrName</i> is set to point to <b>NULL</b>, in which case <b>SysFreeString</b> should not be called. Note that if <i>pstrName</i> points to a valid <b>BSTR</b> on entry, this <b>BSTR</b> is not freed, and a memory leak occurs.
     * @param {Pointer<VARIANT>} pValue This parameter cannot be <b>NULL</b>, and it must point to an empty or uninitialized <b>VARIANT</b>. If no error is returned, the <b>VARIANT</b> is initialized using <b>VariantInit</b>, and then set to contain the context value. The caller must call <b>VariantClear</b> on this pointer when the value is no longer required. If an error code is returned, the <b>VARIANT</b> pointed to by <i>pValue</i> is left unmodified.
     * 
     * If <b>WBEM_S_NO_MORE_DATA</b> returns, this parameter is set to point to a <b>VARIANT</b> of type <b>VT_NULL</b>.
     * 
     * It is possible that an entire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object may be returned inside the <b>VARIANT</b>. If that is the case, then <b>VT_UNKNOWN</b> is the <b>VARIANT</b> type. The caller can take the <b>IUnknown</b> pointer and execute <b>QueryInterface</b> to obtain the 
     * <b>IWbemClassObject</b> pointer.
     * 
     * <div class="alert"><b>Note</b>  At the end of the enumeration, <b>WBEM_S_NO_MORE_DATA</b> is returned. The returned <b>VARIANT</b> is of type <b>VT_NULL</b>, and the returned <i>pstrName</i> is <b>NULL</b>.</div>
     * <div> </div>
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-next
     */
    Next(lFlags, pstrName, pValue) {
        result := ComCall(6, this, "int", lFlags, "ptr", pstrName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The IWbemContext::EndEnumeration method ends an enumeration sequence that begins with IWbemContext::BeginEnumeration. This call is not required, but it releases as early as possible any system resources associated with the enumeration.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>HRESULT indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-endenumeration
     */
    EndEnumeration() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The IWbemContext::SetValue method creates or overwrites a named context value.
     * @param {PWSTR} wszName Cannot be <b>NULL</b>. It is a read-only pointer that  indicates the context value name. This value must be <b>null</b>-terminated.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<VARIANT>} pValue Must point to a valid <b>VARIANT</b>, which is treated as read-only. The value in the <b>VARIANT</b> becomes the named context value. An entire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object can be stored as well as a simple value by enclosing it in a <b>VARIANT</b> that uses the <b>VT_UNKNOWN</b> type. The caller must execute <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the 
     * <b>IWbemClassObject</b> object by asking for <b>IID_IUnknown</b>, and by using the returned pointer in the <b>VARIANT</b>.
     * 
     * If <i>pValue</i> is to contain an embedded 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object, the caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IWbemClassObject::QueryInterface</a> for <b>IID_IUnknown</b> and place the resulting pointer in the <b>VARIANT</b> by using a type of <b>VT_UNKNOWN</b>. The original embedded object is copied during the write operation, and so cannot be modified by the operation.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of a method call. The following list lists and describes the values contained in an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-setvalue
     */
    SetValue(wszName, lFlags, pValue) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(8, this, "ptr", wszName, "int", lFlags, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The IWbemContext::GetValue method is used to retrieve a specific named context value by name.
     * @param {PWSTR} wszName Name for which the value is to be retrieved. This must point to a valid <b>BSTR</b>. The pointer is treated as read-only.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {VARIANT} This parameter cannot be <b>NULL</b> and must point to an uninitialized <b>VARIANT</b>. If no error is returned, the <b>VARIANT</b> is initialized using <b>VariantInit</b>, and then set to contain the context value. The caller must call <b>VariantClear</b> on this pointer when the value is no longer required. If an error code is returned, the <b>VARIANT</b> pointed to by <i>pValue</i> is left unmodified.
     * 
     * It is possible that an entire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object can be returned inside the <b>VARIANT</b>. If that is the case, then <b>VT_UNKNOWN</b> is the <b>VARIANT</b> type. The caller can take the <b>IUnknown</b> pointer and execute <b>QueryInterface</b> to obtain the 
     * <b>IWbemClassObject</b> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-getvalue
     */
    GetValue(wszName, lFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pValue := VARIANT()
        result := ComCall(9, this, "ptr", wszName, "int", lFlags, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The IWbemContext::DeleteValue method deletes a named context value created by IWbemContext::SetValue.
     * @param {PWSTR} wszName Pointer to a valid <b>BSTR</b> containing the named context value to delete. The pointer is treated as read-only.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>HRESULT indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-deletevalue
     */
    DeleteValue(wszName, lFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(10, this, "ptr", wszName, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemContext::DeleteAll method removes all named context values from the current object, thus emptying the object.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>HRESULT indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemcontext-deleteall
     */
    DeleteAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
