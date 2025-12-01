#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemContext interface is optionally used to communicate additional context information to providers when submitting IWbemServices calls to WMI. All primary calls in IWbemServices take an optional parameter pointing to an object of this type.
 * @remarks
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
 * <li><b>VT_UNKNOWN</b></li>
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
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemcontext
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
