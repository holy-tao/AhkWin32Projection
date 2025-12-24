#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPService interface enables an application to query state variables and invoke actions on an instance of a service.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservice
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
     * @param {BSTR} bstrVariableName Specifies the state variable for which to return a value.
     * @returns {VARIANT} Receives a reference to the value of the variable specified by <i>bstrVariableName</i>. The type of the data returned depends on the state variable for which the query was invoked. 
     * 
     * 
     * 
     * 
     * To free this parameter, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-querystatevariable
     */
    QueryStateVariable(bstrVariableName) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        pValue := VARIANT()
        result := ComCall(7, this, "ptr", bstrVariableName, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Invokes a method on the device.
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
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-invokeaction
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
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-get_servicetypeidentifier
     */
    get_ServiceTypeIdentifier() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The AddCallback method registers an application's callback with the UPnP framework.
     * @param {IUnknown} pUnkCallback Specifies the reference to the interface that contains the callback to register. The object referred to by <i>pUnkCallback</i> must either support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservicecallback">IUPnPServiceCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-addcallback
     */
    AddCallback(pUnkCallback) {
        result := ComCall(10, this, "ptr", pUnkCallback, "HRESULT")
        return result
    }

    /**
     * The Id property specifies the service ID for the service.
     * @returns {BSTR} Receives a reference to the service ID. Release this string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required..
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(11, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * For queries related to evented variables, the LastTransportStatus property specifies the HTTP status of the last IUPnPService::InvokeAction operation.
     * @returns {Integer} Receives a reference to the status. If <i>plValue</i> is the HTTP status 200, the operation was successful.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpservice-get_lasttransportstatus
     */
    get_LastTransportStatus() {
        result := ComCall(12, this, "int*", &plValue := 0, "HRESULT")
        return plValue
    }
}
