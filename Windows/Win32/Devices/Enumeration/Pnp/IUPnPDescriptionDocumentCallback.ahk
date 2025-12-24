#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDescriptionDocumentCallback interface allows the UPnP framework to communicate the results of an asynchronous load operation to an application.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdescriptiondocumentcallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDescriptionDocumentCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDescriptionDocumentCallback
     * @type {Guid}
     */
    static IID => Guid("{77394c69-5486-40d6-9bc3-4991983e02da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadComplete"]

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
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocumentcallback-loadcomplete
     */
    LoadComplete(hrLoadResult) {
        result := ComCall(3, this, "int", hrLoadResult, "HRESULT")
        return result
    }
}
