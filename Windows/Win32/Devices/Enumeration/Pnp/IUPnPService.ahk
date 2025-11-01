#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} bstrVariableName 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-querystatevariable
     */
    QueryStateVariable(bstrVariableName, pValue) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        result := ComCall(7, this, "ptr", bstrVariableName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrActionName 
     * @param {VARIANT} vInActionArgs 
     * @param {Pointer<VARIANT>} pvOutActionArgs 
     * @param {Pointer<VARIANT>} pvRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-invokeaction
     */
    InvokeAction(bstrActionName, vInActionArgs, pvOutActionArgs, pvRetVal) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        result := ComCall(8, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pvOutActionArgs, "ptr", pvRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_servicetypeidentifier
     */
    get_ServiceTypeIdentifier(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-addcallback
     */
    AddCallback(pUnkCallback) {
        result := ComCall(10, this, "ptr", pUnkCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_id
     */
    get_Id(pbstrId) {
        result := ComCall(11, this, "ptr", pbstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservice-get_lasttransportstatus
     */
    get_LastTransportStatus(plValue) {
        plValueMarshal := plValue is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plValueMarshal, plValue, "HRESULT")
        return result
    }
}
