#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IUPnPDevice.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDescriptionDocument interface enables an application to load a device description.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdescriptiondocument
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDescriptionDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDescriptionDocument
     * @type {Guid}
     */
    static IID => Guid("{11d1c1b2-7daa-4c9e-9595-7f82ed206d1e}")

    /**
     * The class identifier for UPnPDescriptionDocument
     * @type {Guid}
     */
    static CLSID => Guid("{1d8a9b47-3a28-4ce2-8a4b-bd34e45bceeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReadyState", "Load", "LoadAsync", "get_LoadResult", "Abort", "RootDevice", "DeviceByUDN"]

    /**
     * @type {Integer} 
     */
    ReadyState {
        get => this.get_ReadyState()
    }

    /**
     * @type {Integer} 
     */
    LoadResult {
        get => this.get_LoadResult()
    }

    /**
     * The ReadyState property specifies the status of the document load operation.
     * @returns {Integer} Receives a reference to the ready state. The values this parameter can receive are (in the order they are used by Universal Plug and Play): 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>plReadyState Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READYSTATE_UNINITIALIZED"></a><a id="readystate_uninitialized"></a><dl>
     * <dt><b>READYSTATE_UNINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document object has been created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READYSTATE__LOADING"></a><a id="readystate__loading"></a><dl>
     * <dt><b>READYSTATE _LOADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation has started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READYSTATE__COMPLETE"></a><a id="readystate__complete"></a><dl>
     * <dt><b>READYSTATE _COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation is finished; the document has been downloaded and the XML has been parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READYSTATE__INTERACTIVE"></a><a id="readystate__interactive"></a><dl>
     * <dt><b>READYSTATE _INTERACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READYSTATE__LOADED"></a><a id="readystate__loaded"></a><dl>
     * <dt><b>READYSTATE _LOADED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-get_readystate
     */
    get_ReadyState() {
        result := ComCall(7, this, "int*", &plReadyState := 0, "HRESULT")
        return plReadyState
    }

    /**
     * The Load method loads a document synchronously. This method does not return control to the caller until the load operation is complete.
     * @param {BSTR} bstrUrl Specifies the URL of the document to load.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h, or one of the following UPnP return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document does not have a device element. It is missing either from the root element or the DeviceList element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPnP_E_DEVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no Device element in the specified description document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document is missing one of the required elements from the Device element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ICON_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document does not have an icon element. It is missing from the IconList element, or the DeviceList element does not contain an IconList element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPnP_E_ICON_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no Icon element in the specified description document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ICON_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document is missing one of the required elements from the Icon element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPnP_E_ICON_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no Icon Node in the specified description document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ROOT_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document does not have a root element at the top level of the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPnP_E_ROOT_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no Root element in the specified description document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_SERVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document does not have a service element. It is missing from the ServiceList element, or the DeviceList element does not contain a ServiceList element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_SERVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XML document is missing one of the required elements from the Service element.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-load
     */
    Load(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(8, this, "ptr", bstrUrl, "HRESULT")
        return result
    }

    /**
     * The LoadAsync method loads a document asynchronously. This method returns control to the caller immediately, and uses the specified callback to notify the caller when the operation is complete.
     * @param {BSTR} bstrUrl Specifies the URL of the document to load. If the URL specified is a relative URL, the server name is prepended to the value of <i>bstrUrl</i>.
     * @param {IUnknown} punkCallback Reference to an <b>IUnknown</b> specifying the callback that the UPnP framework uses to notify the caller when the operation is complete. If the load operation did not fail immediately, this callback indicates whether or not the load operation succeeded or failed. The object referred to by <i>pUnkCallback</i> must support either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdescriptiondocumentcallback">IUPnPDescriptionDocumentCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h, or one of the following UPnP return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a device element It is missing either from the root element or the <b>DeviceList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Device</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ICON_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have an icon element. It is missing from the <b>IconList</b> element, or the <b>DeviceList</b> element does not contain an <b>IconList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ICON_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Icon</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_ROOT_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a root element at the top level of the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_SERVICE_ELEMENT_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document does not have a service element. It is missing from the <b>ServiceList</b> element, or the <b>DeviceList</b> element does not contain a <b>ServiceList</b> element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_SERVICE_NODE_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is missing one of the required elements from the <b>Service</b> element.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-loadasync
     */
    LoadAsync(bstrUrl, punkCallback) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(9, this, "ptr", bstrUrl, "ptr", punkCallback, "HRESULT")
        return result
    }

    /**
     * The LoadResult property specifies the success or failure code of a completed load operation.
     * @returns {Integer} Receives a reference to the success or failure code. The values this parameter can receive are:
     * 
     * <table>
     * <tr>
     * <th>phrError Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_FAIL"></a><a id="e_fail"></a><dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_PENDING"></a><a id="e_pending"></a><dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation is not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="E_UNEXPECTED"></a><a id="e_unexpected"></a><dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred during the load operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-get_loadresult
     */
    get_LoadResult() {
        result := ComCall(10, this, "int*", &phrError := 0, "HRESULT")
        return phrError
    }

    /**
     * The Abort method stops an asynchronous load operation started by IUPnPDescriptionDocument::LoadAsync.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-abort
     */
    Abort() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The RootDevice method returns the root device of the currently loaded document's device tree.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the device. This reference must be released when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-rootdevice
     */
    RootDevice() {
        result := ComCall(12, this, "ptr*", &ppudRootDevice := 0, "HRESULT")
        return IUPnPDevice(ppudRootDevice)
    }

    /**
     * The DeviceByUDN method returns the device with the specified unique device name (UDN) contained within the loaded description document.
     * @param {BSTR} bstrUDN Specifies the UDN of the device.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that describes the device. This reference must be released when it is no longer used.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdescriptiondocument-devicebyudn
     */
    DeviceByUDN(bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(13, this, "ptr", bstrUDN, "ptr*", &ppudDevice := 0, "HRESULT")
        return IUPnPDevice(ppudDevice)
    }
}
