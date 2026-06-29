#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDescriptionDocumentCallback interface allows the UPnP framework to communicate the results of an asynchronous load operation to an application.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdescriptiondocumentcallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDescriptionDocumentCallback extends IUnknown {
    /**
     * The interface identifier for IUPnPDescriptionDocumentCallback
     * @type {Guid}
     */
    static IID := Guid("{77394c69-5486-40d6-9bc3-4991983e02da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDescriptionDocumentCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDescriptionDocumentCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The LoadComplete method is invoked when the UPnP framework has finished loading a device description.
     * @param {HRESULT} hrLoadResult Specifies the load operation that the UPnP framework has completed. Possible return values are:
     * 
     * <table>
     * <tr>
     * <th>UPnP-specific return value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_DEVICE_ELEMENT_EXPECTED"></a><a id="upnp_e_device_element_expected"></a><dl>
     * <dt><b>UPNP_E_DEVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a device element. It is missing either from the root element or the <b>DeviceList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_DEVICE_NODE_INCOMPLETE"></a><a id="upnp_e_device_node_incomplete"></a><dl>
     * <dt><b>UPNP_E_DEVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Device</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_ICON_ELEMENT_EXPECTED"></a><a id="upnp_e_icon_element_expected"></a><dl>
     * <dt><b>UPNP_E_ICON_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have an icon element. It is missing from the <b>IconList</b> element, or the <b>DeviceList</b> element does not contain an <b>IconList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_ICON_NODE_INCOMPLETE"></a><a id="upnp_e_icon_node_incomplete"></a><dl>
     * <dt><b>UPNP_E_ICON_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Icon</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_ROOT_ELEMENT_EXPECTED"></a><a id="upnp_e_root_element_expected"></a><dl>
     * <dt><b>UPNP_E_ROOT_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a root element at the top level of the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_SERVICE_ELEMENT_EXPECTED"></a><a id="upnp_e_service_element_expected"></a><dl>
     * <dt><b>UPNP_E_SERVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a service element. It is missing from the <b>ServiceList</b> element, or the <b>DeviceList</b> element does not contain a <b>ServiceList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_E_SERVICE_NODE_INCOMPLETE"></a><a id="upnp_e_service_node_incomplete"></a><dl>
     * <dt><b>UPNP_E_SERVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Service</b> element.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The application should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdescriptiondocumentcallback-loadcomplete
     */
    LoadComplete(hrLoadResult) {
        result := ComCall(3, this, "int", hrLoadResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPDescriptionDocumentCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadComplete := CallbackCreate(GetMethod(implObj, "LoadComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadComplete)
    }
}
