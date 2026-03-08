#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPService interface enables an application to query state variables and invoke actions on an instance of a service.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpservice
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPService extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPService
     * @type {Guid}
     */
    static IID => Guid("{a295019c-dc65-47dd-90dc-7fe918a1ab44}")

    /**
     * The class identifier for UPnPService
     * @type {Guid}
     */
    static CLSID => Guid("{c624ba95-fbcb-4409-8c03-8cceec533ef1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryStateVariable", "InvokeAction", "get_ServiceTypeIdentifier", "AddCallback", "get_Id", "get_LastTransportStatus"]

    /**
     * @type {BSTR} 
     */
    ServiceTypeIdentifier {
        get => this.get_ServiceTypeIdentifier()
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    LastTransportStatus {
        get => this.get_LastTransportStatus()
    }

    /**
     * The QueryStateVariable method returns the value of the specified service's state variable.
     * @remarks
     * The UPnP Forum discourages use of this method. If possible, use a service-specific action, if one has been provided.
     * 
     * This method retrieves the values of evented variables from the service object's local cache. The cache contains the value for each variable indicated in the last event notification. This method retrieves the values of non-evented variables by sending a remote query to the device.
     * 
     * If an application invokes this method for an evented state variable, between the time a service first initializes itself and the time it processes its first event, <b>UPNP_E_VARIABLE_VALUE_UNKNOWN</b> is returned.
     * 
     * If an application invokes this method for a service that does not use events, and the HTTP request fails, <b>UPNP_E_TRANSPORT_ERROR</b> is returned. To view the status, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus">IUPnPService::LastTransportStatus</a>.
     * 
     * <div class="alert"><b>Note</b>  The time.tz variable can contain incorrect timezone information on the control point. For example, you can have a device and a control point running in the same timezone, -7.00. When the control point queries a time.tz variable for the current time, the device returns a datestructure with the timezone value set to -8.00 instead of -7.00.<p class="note">To work around this issue, use the dataTime.tz variable type instead time.tz on the control point.
     * 
     * </div>
     * <div> </div>
     * @param {BSTR} bstrVariableName Specifies the state variable for which to return a value.
     * @returns {VARIANT} Receives a reference to the value of the variable specified by <i>bstrVariableName</i>. The type of the data returned depends on the state variable for which the query was invoked. 
     * 
     * 
     * 
     * 
     * To free this parameter, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-querystatevariable
     */
    QueryStateVariable(bstrVariableName) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        pValue := VARIANT()
        result := ComCall(7, this, "ptr", bstrVariableName, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Invokes a method on the device.
     * @remarks
     * When an application invokes the method <b>InvokeAction</b>, it includes a list of arguments that should match the arguments expected by the service. The Control Point maps these <b>VARIANT</b> arguments to the required type. The following table shows the mappings that are used.
     * 
     * <table>
     * <tr>
     * <th>Data type</th>
     * <th>Type returned by MSXML</th>
     * </tr>
     * <tr>
     * <td>
     * <b>SDT_STRING</b> = 0
     * 
     * </td>
     * <td><b>VT_BSTR</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_NUMBER</b></td>
     * <td><b>VT_BSTR</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_INT</b></td>
     * <td><b>VT_I4</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_FIXED_14_4</b></td>
     * <td><b>VT_CY</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_BOOLEAN</b></td>
     * <td><b>VT_BOOL</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_DATETIME_ISO8601</b></td>
     * <td><b>VT_DATE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_DATETIME_ISO8601TZ</b></td>
     * <td><b>VT_DATE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_DATE_ISO8601</b></td>
     * <td><b>VT_DATE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_TIME_ISO8601</b></td>
     * <td><b>VT_DATE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_TIME_ISO8601TZ</b></td>
     * <td><b>VT_DATE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_I1</b></td>
     * <td><b>VT_I1</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_I2</b></td>
     * <td><b>VT_I2</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_I4</b></td>
     * <td><b>VT_I4</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_UI1</b></td>
     * <td><b>VT_UI1</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_UI2</b></td>
     * <td><b>VT_UI2</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_UI4</b></td>
     * <td><b>VT_UI4</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_R4</b></td>
     * <td><b>VT_FLOAT</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_R8</b></td>
     * <td><b>VT_DOUBLE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_FLOAT</b></td>
     * <td><b>VT_DOUBLE</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_UUID</b></td>
     * <td><b>VT_BSTR</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_BIN_BASE64</b></td>
     * <td><b>VT_ARRAY</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_BIN_HEX</b></td>
     * <td><b>VT_ARRAY</b></td>
     * </tr>
     * <tr>
     * <td><b>SDT_CHAR</b></td>
     * <td>
     * <b>VT_UI2</b> (a wchar)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>SDT_URI</b></td>
     * <td><b>VT_BSTR</b></td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Parameters that receive values must not be passed a <b>NULL</b> value when the method is called.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  A floating-point value sent by a device as an [out] argument or a return value will be changed when received by the control point. For example, consider a device with an action Action1Out_float that returns a single [out] floating-point argument. When a control point invokes this action, the device returns the value -234.567; however, the control point actually receives the value -234.567001342773 instead of the expected value -234.567.<p class="note">To work around this issue, use r4 instead of float as the UPnP data type for non-integer numeric values.
     * 
     * </div>
     * <div> </div>
     * @param {BSTR} bstrActionName Specifies the method to invoke.
     * @param {VARIANT} vInActionArgs Specifies an array of input arguments to the method. If the action has no input arguments, this parameter must contain an empty array. 
     * 
     * 
     * 
     * 
     * The contents of this array are service-specific.
     * @param {Pointer<VARIANT>} pvOutActionArgs On input, contains a reference to an empty array. On output, receives a reference to the array of output arguments. If the action has no output arguments, this parameter contains an empty array. 
     * 						
     * 
     * The contents of this parameter are service-specific.
     * 
     * Free this parameter with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @returns {VARIANT} On input, contains a reference to an empty array. On output, receives a reference to a <b>VARIANT</b> that contains the return value of this action.
     * 
     * If the device returns an error after the action is invoked on it and this parameter is not set to <b>NULL</b>, this parameter will contain specific text describing the error upon return. For more information on the errors returned by devices, please refer to the <a href="https://docs.microsoft.com/windows/desktop/UPnP/device-error-codes">Device Error Codes</a> documentation.
     * 
     * Free this parameter with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-invokeaction
     */
    InvokeAction(bstrActionName, vInActionArgs, pvOutActionArgs) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        pvRetVal := VARIANT()
        result := ComCall(8, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pvOutActionArgs, "ptr", pvRetVal, "HRESULT")
        return pvRetVal
    }

    /**
     * The ServiceTypeIdentifier property specifies the service type identifier for the device.
     * @returns {BSTR} Receives a reference to a string that contains the service type identifier. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_servicetypeidentifier
     */
    get_ServiceTypeIdentifier() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The AddCallback method registers an application's callback with the UPnP framework.
     * @remarks
     * Do not call this method from within a callback; memory corruption occurs.
     * 
     * If more than one callback is registered, the UPnP framework invokes the callbacks sequentially.
     * 
     * The object referred to by <i>pUnkCallback</i> must either support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservicecallback">IUPnPServiceCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. The 
     * <b>AddCallback</b> method first queries <i>pUnkCallback</i> for the 
     * <b>IUPnPServiceCallback</b> interface. If this interface is not supported, the 
     * <b>AddCallback</b> method then queries <i>pUnkCallback</i> for the <b>IDispatch</b> interface. If the <b>IDispatch</b> interface is not supported, both checks have failed and the 
     * <b>AddCallback</b> method returns E_FAIL.
     * 
     * If only <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> is supported, the <a href="https://docs.microsoft.com/windows/desktop/UPnP/s-gly">service object</a> invokes the callback by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> with the dispatch ID specified as zero, which indicates the default method. This default <b>IDispatch</b> method is passed the same parameters as the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservicecallback">IUPnPServiceCallback</a> method, but the first parameter passed is a string that indicates the reason the callback is invoked. Valid values are VARIABLE_UPDATE and SERVICE_INSTANCE_DIED.
     * 
     * 
     * This method has the following arguments:
     * 
     * <ul>
     * <li>The reason the callback is invoked. It is invoked either because a state variable changed (VARIABLE_UPDATE) or because the service instance has become unavailable (SERVICE_INSTANCE_DIED).</li>
     * <li>The service object for which the callback is invoked.</li>
     * </ul>
     * 
     * 
     * 
     * If the callback is invoked for a state variable change, the method is passed two additional arguments:
     * 
     * <ul>
     * <li>The name of the variable that changed.</li>
     * <li>The new value.</li>
     * </ul>
     * @param {IUnknown} pUnkCallback Specifies the reference to the interface that contains the callback to register. The object referred to by <i>pUnkCallback</i> must either support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservicecallback">IUPnPServiceCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-addcallback
     */
    AddCallback(pUnkCallback) {
        result := ComCall(10, this, "ptr", pUnkCallback, "HRESULT")
        return result
    }

    /**
     * The Id property specifies the service ID for the service.
     * @returns {BSTR} Receives a reference to the service ID. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required..
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(11, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * For queries related to evented variables, the LastTransportStatus property specifies the HTTP status of the last IUPnPService::InvokeAction operation.
     * @returns {Integer} Receives a reference to the status. If <i>plValue</i> is the HTTP status 200, the operation was successful.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus
     */
    get_LastTransportStatus() {
        result := ComCall(12, this, "int*", &plValue := 0, "HRESULT")
        return plValue
    }
}
