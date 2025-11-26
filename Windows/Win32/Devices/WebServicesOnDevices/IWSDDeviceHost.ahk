#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DPWS-compliant device.
 * @remarks
 * 
 * After retrieving this interface, the application would then:
 * 
 * <ol>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerporttype">RegisterPortType</a> method to register all necessary port types.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-setmetadata">SetMetadata</a> to describe the device and optionally call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice">RegisterService</a> one or more times to register services described in the service host metadata.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-start">Start</a> method to start the device host and to publish the device using WS-Discovery.After starting the device host, you can optionally:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-adddynamicservice">AddDynamicService</a> for services not described in the service host metadata (for example, an ad hoc print job).</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-retireservice">RetireService</a> to terminate action on and disconnect a service activated by the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice">RegisterService</a> method.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-signalevent">SignalEvent</a> method to indicate that notifications should be sent for subscriptions relating to a particular event.</li>
 * </ol>
 * </li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-stop">Stop</a> method to terminate host execution and terminate publication of the device.</li>
 * </ol>
 * 
 * 
 * An <b>IWSDDeviceHost</b> object can provide an object for a service on demand (using a notification callback) when calling the host receives a request message directed at that service.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nn-wsdhost-iwsddevicehost
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDDeviceHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDDeviceHost
     * @type {Guid}
     */
    static IID => Guid("{917fe891-3d13-4138-9809-934c8abeb12c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Start", "Stop", "Terminate", "RegisterPortType", "SetMetadata", "RegisterService", "RetireService", "AddDynamicService", "RemoveDynamicService", "SetServiceDiscoverable", "SignalEvent"]

    /**
     * Initializes an instance of an IWSDDeviceHost object.
     * @param {PWSTR} pszLocalId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. If <i>pszLocalId</i> is a logical address, the host will announce the logical address and then convert the address to a physical address when it receives Resolve or Probe messages.
     * 
     * 
     * If <i>pszLocalId</i> is a physical address (such as  URL prefixed by http or https), the host will use the address as the physical address and will host on that address instead of the default one.
     * 
     * 
     * For secure communication, <i>pszLocalId</i> must be an URL prefixed by https, and the host will use the SSL/TLS protocol on the port specified in the URL.  The recommended port is port 5358, as this port is reserved for secure connections with WSDAPI.
     * If no port is specified, then the host will use port 443. The host port must be configured with an SSL server certificate.  For more information about the configuration of host ports, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
     * 
     * 
     * Any URL (http or https) must be terminated with a trailing slash. The URL must  contain a valid IP address or hostname.
     * 
     * The following list shows some example values for <i>pszLocalId</i>. It is not a complete list of valid values.
     * 
     * <ul>
     * <li>http://192.168.0.1:5357/</li>
     * <li>http://localhost/</li>
     * <li>http://myHostname:5357/
     * </li>
     * <li>https://192.168.0.1:5358/
     * </li>
     * <li>https://myHostname/
     * </li>
     * <li>https://myHostname/myDevice/
     * </li>
     * <li>https://myHostname:5358/
     * </li>
     * </ul>
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces.
     * @param {Pointer<IWSDAddress>} ppHostAddresses A single <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> object or <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdtransportaddress">IWSDTransportAddress</a> object. The objects provide information about specific addresses that the host should listen on.
     * 
     * If <i>pszLocalId</i> contains a local address, the resulting behavior is a mapping between the logical address and the supplied physical address (instead of a mapping between the logical address and the default physical address).
     * @param {Integer} dwHostAddressCount The number of items in the <i>ppHostAddresses</i> array. If <i>ppHostAddresses</i> is an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface, count must be 1.
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
     * <i>pszLocalId</i> is <b>NULL</b>, the length in characters of <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or the number of addresses referenced by <i>ppHostAddresses</i> does not match <i>dwHostAddressCount</i>.
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
     * The device host is in an unexpected state.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Initialization could not be completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-init
     */
    Init(pszLocalId, pContext, ppHostAddresses, dwHostAddressCount) {
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := ComCall(3, this, "ptr", pszLocalId, "ptr", pContext, "ptr*", ppHostAddresses, "uint", dwHostAddressCount, "HRESULT")
        return result
    }

    /**
     * Starts the device host and publishes the device host using a WS-Discovery Hello message.
     * @param {Integer} ullInstanceId The instance identifier. If no identifier is provided, the current instance value + 1 is used as the default.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the WS-Discovery specification, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Pointer<WSD_URI_LIST>} pScopeList Scope of the device host. If <b>NULL</b>, no scopes are associated with the host.
     * @param {IWSDDeviceHostNotify} pNotificationSink Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nn-wsdhost-iwsddevicehostnotify">IWSDDeviceHostNotify</a> object that specifies the notification sink.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device host has already been started.
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
     * The method failed. It may have failed because the host has not been initialized. Call <a href="/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-init">Init</a> to initialize a device host.
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
     * There is no metadata associated with the host.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-start
     */
    Start(ullInstanceId, pScopeList, pNotificationSink) {
        result := ComCall(4, this, "uint", ullInstanceId, "ptr", pScopeList, "ptr", pNotificationSink, "HRESULT")
        return result
    }

    /**
     * Sends a WS-Discovery Bye message and stops the host.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The host has already stopped.
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
     * The host is not initialized or the host is not started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Terminates the host and releases any attached services.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The host is uninitialized or the host has already been terminated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-terminate
     */
    Terminate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Registers a port type for incoming messages.
     * @param {Pointer<WSD_PORT_TYPE>} pPortType Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_port_type">WSD_PORT_TYPE</a> structure that describes the port type.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The port type specified by   <i>pPortType</i> has already been registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-registerporttype
     */
    RegisterPortType(pPortType) {
        result := ComCall(7, this, "ptr", pPortType, "HRESULT")
        return result
    }

    /**
     * Sets the metadata for a device, excluding user-defined service metadata.
     * @param {Pointer<WSD_THIS_MODEL_METADATA>} pThisModelMetadata Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata">WSD_THIS_MODEL_METADATA</a> structure which specifies metadata that is common to all instances of the model of this device. 
     * The <b>Manufacturer</b>, <b>ModelNames</b>, and <b>ModelNumber</b> members of the structure must contain non-<b>NULL</b>, non-blank entries.
     * @param {Pointer<WSD_THIS_DEVICE_METADATA>} pThisDeviceMetadata Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata">WSD_THIS_DEVICE_METADATA</a> structure which specifies metadata unique to this device. The <b>FriendlyName</b>, <b>FirmwareVersion</b>, and <b>SerialNumber</b> members of this structure must contain non-<b>NULL</b>, non-blank entries.
     * @param {Pointer<WSD_HOST_METADATA>} pHostMetadata Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_host_metadata">WSD_HOST_METADATA</a> structure that specifies service host metadata, which the specific data and characteristics of the device (for example, a printer supports color or has a stapler.).
     * @param {Pointer<WSD_METADATA_SECTION_LIST>} pCustomMetadata Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list">WSD_METADATA_SECTION_LIST</a> structure which specifies additional custom metadata associated with this device.
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
     * <i>pThisDeviceMetadata</i> is <b>NULL</b>,  <i>pThisModelMetadata</i> is <b>NULL</b>, or either structure does not contain the required members. See the parameter descriptions for a list of required members.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-setmetadata
     */
    SetMetadata(pThisModelMetadata, pThisDeviceMetadata, pHostMetadata, pCustomMetadata) {
        result := ComCall(8, this, "ptr", pThisModelMetadata, "ptr", pThisDeviceMetadata, "ptr", pHostMetadata, "ptr", pCustomMetadata, "HRESULT")
        return result
    }

    /**
     * Registers a service object for incoming requests and adds the service to the device host metadata.
     * @param {PWSTR} pszServiceId The ID of the service to be registered. This ID must appear in the device's service host metadata.
     * @param {IUnknown} pService The service object that will handle requests addressed to the specified service.
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
     * <i>pszServiceId</i> is <b>NULL</b>, the length in characters of <i>pszServiceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or a service matching <i>pszServiceId</i> has already been registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-registerservice
     */
    RegisterService(pszServiceId, pService) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(9, this, "ptr", pszServiceId, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Unregisters a service object that was registered using RegisterService and removes the service from the device host metadata.
     * @param {PWSTR} pszServiceId The ID of the service to be removed.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszServiceId</i> is <b>NULL</b>.
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
     * The length in characters of <i>pszServiceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pszServiceId</i> was not found in the list of registered services.
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
     * The method failed. It may have failed because the host has not been initialized. Call <a href="/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-init">Init</a> to initialize a device host.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-retireservice
     */
    RetireService(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(10, this, "ptr", pszServiceId, "HRESULT")
        return result
    }

    /**
     * Registers a service object for incoming requests, but does not add the service to the device host metadata. This is used for transient (dynamic) services.
     * @param {PWSTR} pszServiceId The ID for the dynamic service. The service ID must be distinct from all the service IDs in the service host metadata and from any other registered dynamic service. The <i>pszServiceId</i> must be a URI.
     * @param {PWSTR} pszEndpointAddress An optional URI to use as the endpoint address for this service. If none is specified, the device host will assume the service should be available on all local transport addresses.
     * @param {Pointer<WSD_PORT_TYPE>} pPortType Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_port_type">WSD_PORT_TYPE</a> structure that specifies the port type. 
     * May be <b>NULL</b>. Specify only one of <i>pPortType</i> and <i>pPortName</i>.
     * @param {Pointer<WSDXML_NAME>} pPortName Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the type of the service, with associating the service with a specified port. Specify only one of <i>pPortType</i> and <i>pPortName</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Optional reference to an extensible section to be included in the dynamic service metadata.
     * @param {IUnknown} pService Optional reference to a host service object to register.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszServiceId</i> is <b>NULL</b>.
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
     * The length in characters of <i>pszServiceId</i> or <i>pszEndpointAddress</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or both <i>pPortType</i> and <i>pPortName</i> are specified.
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
     * The method failed. It may have failed because the host has not been initialized, or the service specified by <i>pszServiceId</i> could not be found. Call <a href="/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-init">Init</a> to initialize a device host.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-adddynamicservice
     */
    AddDynamicService(pszServiceId, pszEndpointAddress, pPortType, pPortName, pAny, pService) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId
        pszEndpointAddress := pszEndpointAddress is String ? StrPtr(pszEndpointAddress) : pszEndpointAddress

        result := ComCall(11, this, "ptr", pszServiceId, "ptr", pszEndpointAddress, "ptr", pPortType, "ptr", pPortName, "ptr", pAny, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Unregisters a service object that was registered using AddDynamicService.
     * @param {PWSTR} pszServiceId The ID for the dynamic service to be removed.
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
     * <i>pszServiceId</i> is <b>NULL</b>, the length in characters of <i>pszServiceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pszServiceId</i> was not found in the list of dynamic services.
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
     * The method failed. It may have failed because the host has not been initialized. Call <a href="/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-init">Init</a> to initialize a device host.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-removedynamicservice
     */
    RemoveDynamicService(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(12, this, "ptr", pszServiceId, "HRESULT")
        return result
    }

    /**
     * Controls whether or not the service is advertised using WS-Discovery.
     * @param {PWSTR} pszServiceId The ID for the service.
     * @param {BOOL} fDiscoverable <b>TRUE</b> if the service can be found
     *     using WS-Discovery, <b>FALSE</b> if the service is not visible to WS-Discovery.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * <i>pszServiceId</i> is <b>NULL</b>, the length in characters of <i>pszServiceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pszServiceId</i>  does not correspond to a registered service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-setservicediscoverable
     */
    SetServiceDiscoverable(pszServiceId, fDiscoverable) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(13, this, "ptr", pszServiceId, "int", fDiscoverable, "HRESULT")
        return result
    }

    /**
     * Notifies all subscribed clients that an event has occurred.
     * @param {PWSTR} pszServiceId The ID of the service that generates the event.
     * @param {Pointer<Void>} pBody The body of the event.
     * @param {Pointer<WSD_OPERATION>} pOperation Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that specifies the operation.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The host is not started. Call <a href="/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-start">Start</a> to start the device host.
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
     * <i>pszServiceId</i> is <b>NULL</b>, <i>pOperation</i> is <b>NULL</b>, the length in characters of <i>pszServiceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192),  there is no <i>ResponseType</i> structure associated with <i>pOperation</i>, or the service specified by <i>pszServiceId</i> is not subscribed to the event specified by the <i>ResponseType</i> member of <i>pOperation</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-iwsddevicehost-signalevent
     */
    SignalEvent(pszServiceId, pBody, pOperation) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, "ptr", pszServiceId, pBodyMarshal, pBody, "ptr", pOperation, "HRESULT")
        return result
    }
}
