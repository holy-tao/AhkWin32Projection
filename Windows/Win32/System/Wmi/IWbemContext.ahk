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
     * 
     * @returns {IWbemContext} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppNewCopy := 0, "HRESULT")
        return IWbemContext(ppNewCopy)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-getnames
     */
    GetNames(lFlags) {
        result := ComCall(4, this, "int", lFlags, "ptr*", &pNames := 0, "HRESULT")
        return pNames
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-beginenumeration
     */
    BeginEnumeration(lFlags) {
        result := ComCall(5, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-next
     */
    Next(lFlags, pstrName, pValue) {
        result := ComCall(6, this, "int", lFlags, "ptr", pstrName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-endenumeration
     */
    EndEnumeration() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-setvalue
     */
    SetValue(wszName, lFlags, pValue) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(8, this, "ptr", wszName, "int", lFlags, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-getvalue
     */
    GetValue(wszName, lFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pValue := VARIANT()
        result := ComCall(9, this, "ptr", wszName, "int", lFlags, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-deletevalue
     */
    DeleteValue(wszName, lFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(10, this, "ptr", wszName, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemcontext-deleteall
     */
    DeleteAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
