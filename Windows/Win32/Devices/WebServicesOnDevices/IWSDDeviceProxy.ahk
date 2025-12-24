#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include .\IWSDServiceProxy.ahk
#Include .\IWSDEndpointProxy.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a remote Devices Profile for Web Services (DPWS) device for client applications and middleware.
 * @remarks
 * 
 * This interface is a client-side representation of a remote device. The proxy provides basic access to device metadata (<a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata">WSD_THIS_DEVICE_METADATA</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata">WSD_THIS_MODEL_METADATA</a>), in addition to providing methods for creating service proxy objects. The service proxy objects correspond to service hosted on the device. For example, a television is a device and the tuner portion of the television is a service hosted on the device that has an accessible, atomic set of functions.
 * 
 * The <b>IWSDDeviceProxy</b> object exposes WSD-specific device semantics.
 * 
 * To use <b>IWSDDeviceProxy</b> in your client or middleware application: 
 * 
 * 
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxy">WSDCreateDeviceProxy</a>.</li>
 * <li>Call any of the four metadata methods of the device proxy object.</li>
 * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> object, either by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybyid">GetServiceProxyById</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybytype">GetServiceProxyByType</a>.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsddeviceproxy
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDDeviceProxy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDDeviceProxy
     * @type {Guid}
     */
    static IID => Guid("{eee0c031-c578-4c0e-9a3b-973c35f409db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "BeginGetMetadata", "EndGetMetadata", "GetHostMetadata", "GetThisModelMetadata", "GetThisDeviceMetadata", "GetAllMetadata", "GetServiceProxyById", "GetServiceProxyByType", "GetEndpointProxy"]

    /**
     * Initializes the device proxy, optionally sharing a session with a previously initialized sponsoring device proxy.
     * @param {PWSTR} pszDeviceId The logical address (ID) of the device.
     * @param {IWSDAddress} pDeviceAddress Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> object that contains the device configuration data.
     * @param {PWSTR} pszLocalId The logical address of the client. The logical address is of the form, urn:uuid:{guid}. Used when the server needs to initiate a connection to the client.
     * @param {IWSDXMLContext} pContext Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {IWSDDeviceProxy} pSponsor Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsddeviceproxy">IWSDDeviceProxy</a> object that is an optional device with which to share a session and lower layers.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszDeviceId</i> is <b>NULL</b>,  <i>pszLocalId</i> is <b>NULL</b>, or the length in characters of either identifier string exceeds WSD_MAX_TEXT_LENGTH (8192). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-init
     */
    Init(pszDeviceId, pDeviceAddress, pszLocalId, pContext, pSponsor) {
        pszDeviceId := pszDeviceId is String ? StrPtr(pszDeviceId) : pszDeviceId
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := ComCall(3, this, "ptr", pszDeviceId, "ptr", pDeviceAddress, "ptr", pszLocalId, "ptr", pContext, "ptr", pSponsor, "HRESULT")
        return result
    }

    /**
     * Sends an asynchronous request for metadata.
     * @returns {IWSDAsyncResult} Returns an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> object that can be used to determine whether an operation has completed.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-begingetmetadata
     */
    BeginGetMetadata() {
        result := ComCall(4, this, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Ends an asynchronous request for metadata.
     * @param {IWSDAsyncResult} pResult The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-begingetmetadata">BeginGetMetadata</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pResult</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The metadata was not returned, was invalid, or a fault was generated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-endgetmetadata
     */
    EndGetMetadata(pResult) {
        result := ComCall(5, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Retrieves class-specific metadata for the device describing the features of the device and the services it hosts.
     * @returns {Pointer<WSD_HOST_METADATA>} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_host_metadata">WSD_HOST_METADATA</a> structure that specifies metadata. 
     * Do not release this object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-gethostmetadata
     */
    GetHostMetadata() {
        result := ComCall(6, this, "ptr*", &ppHostMetadata := 0, "HRESULT")
        return ppHostMetadata
    }

    /**
     * Retrieves model-specific metadata for the device.
     * @returns {Pointer<WSD_THIS_MODEL_METADATA>} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata">WSD_THIS_MODEL_METADATA</a> structure that specifies manufacturer and model-specific metadata. Do not release this object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getthismodelmetadata
     */
    GetThisModelMetadata() {
        result := ComCall(7, this, "ptr*", &ppManufacturerMetadata := 0, "HRESULT")
        return ppManufacturerMetadata
    }

    /**
     * Retrieves device-specific metadata for this device.
     * @returns {Pointer<WSD_THIS_DEVICE_METADATA>} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata">WSD_THIS_DEVICE_METADATA</a> structure that specifies the device-specific metadata of this device. 
     * Do not release this object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getthisdevicemetadata
     */
    GetThisDeviceMetadata() {
        result := ComCall(8, this, "ptr*", &ppThisDeviceMetadata := 0, "HRESULT")
        return ppThisDeviceMetadata
    }

    /**
     * Retrieves all metadata for this device.
     * @returns {Pointer<WSD_METADATA_SECTION_LIST>} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list">WSD_METADATA_SECTION_LIST</a> structure that specifies all metadata related to a device. 
     * Do not release this object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getallmetadata
     */
    GetAllMetadata() {
        result := ComCall(9, this, "ptr*", &ppMetadata := 0, "HRESULT")
        return ppMetadata
    }

    /**
     * Retrieves a generic IWSDServiceProxy service proxy by service ID.
     * @param {PWSTR} pszServiceId The service ID.
     * @returns {IWSDServiceProxy} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> object for the specified service proxy.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybyid
     */
    GetServiceProxyById(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(10, this, "ptr", pszServiceId, "ptr*", &ppServiceProxy := 0, "HRESULT")
        return IWSDServiceProxy(ppServiceProxy)
    }

    /**
     * Retrieves a generic IWSDServiceProxy proxy for a service exposed by the device by port type name.
     * @param {Pointer<WSDXML_NAME>} pType Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the port type name.
     * @returns {IWSDServiceProxy} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> object associated with the specified service.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybytype
     */
    GetServiceProxyByType(pType) {
        result := ComCall(11, this, "ptr", pType, "ptr*", &ppServiceProxy := 0, "HRESULT")
        return IWSDServiceProxy(ppServiceProxy)
    }

    /**
     * Retrieves the endpoint proxy for the device.
     * @returns {IWSDEndpointProxy} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdendpointproxy">IWSDEndpointProxy</a> interface that implements a device services messaging proxy for this device.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsddeviceproxy-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(12, this, "ptr*", &ppProxy := 0, "HRESULT")
        return IWSDEndpointProxy(ppProxy)
    }
}
