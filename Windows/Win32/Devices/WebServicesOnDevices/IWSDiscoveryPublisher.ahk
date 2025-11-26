#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDXMLContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for announcing hosts and managing incoming queries to hosts.
 * @remarks
 * 
 *  This interface represents the "server" or "host" side of <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoverypublisher
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryPublisher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDiscoveryPublisher
     * @type {Guid}
     */
    static IID => Guid("{ae01e1a8-3ff9-4148-8116-057cc616fe13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAddressFamily", "RegisterNotificationSink", "UnRegisterNotificationSink", "Publish", "UnPublish", "MatchProbe", "MatchResolve", "PublishEx", "MatchProbeEx", "MatchResolveEx", "RegisterScopeMatchingRule", "UnRegisterScopeMatchingRule", "GetXMLContext"]

    /**
     * Specifies the IP address family (IPv4, IPv6, or both) over which the host will be published.
     * @param {Integer} dwAddressFamily The address family over which the host will be published.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV4"></a><a id="wsdapi_addressfamily_ipv4"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Publish the host over IPv4 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV6"></a><a id="wsdapi_addressfamily_ipv6"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Publish the host over IPv6 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_ADDRESSFAMILY_IPV4___WSDAPI_ADDRESSFAMILY_IPV6"></a><a id="wsdapi_addressfamily_ipv4___wsdapi_addressfamily_ipv6"></a><dl>
     * <dt><b>WSDAPI_ADDRESSFAMILY_IPV4 | WSDAPI_ADDRESSFAMILY_IPV6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Publish the host over IPv4 and IPv6 addresses.
     * 
     * </td>
     * </tr>
     * </table>
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
     * The method completed successfully.
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
     * <i>dwAddressFamily</i> has a value other than WSDAPI_ADDRESSFAMILY_IPV4, WSDAPI_ADDRESSFAMILY_IPV6, or WSDAPI_ADDRESSFAMILY_IPV4 | WSDAPI_ADDRESSFAMILY_IPV6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INVALIDFUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family has already been set for this publisher.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(WSAESOCKTNOSUPPORT)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not support the address family specified by <i>dwAddressFamily</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-setaddressfamily
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "HRESULT")
        return result
    }

    /**
     * Attaches a callback notification sink to the discovery publisher.
     * @param {IWSDiscoveryPublisherNotify} pSink Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoverypublishernotify">IWSDiscoveryPublisherNotify</a> object that represents the initialized interface to receive callback notifications. This parameter cannot be <b>NULL</b>.
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
     * The method completed successfully.
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
     * <i>pSink</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink
     */
    RegisterNotificationSink(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Detaches a callback notification sink from the discovery publisher.
     * @param {IWSDiscoveryPublisherNotify} pSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoverypublishernotify">IWSDiscoveryPublisherNotify</a> interface that will stop receiving callback notifications.
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
     * The method completed successfully.
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
     * <i>pSink</i> is <b>NULL</b>.
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-unregisternotificationsink
     */
    UnRegisterNotificationSink(pSink) {
        result := ComCall(5, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Announces the presence of a network host by sending a Hello message.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion Current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted. For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains hash values in string form. May be <b>NULL</b>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host. May be <b>NULL</b>.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_CALLBACK_ACTIVE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no registered notification sink. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-publish
     */
    Publish(pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(6, this, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * Announces the departure of a network host by sending a Bye message.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted. For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the message body.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-unpublish
     */
    UnPublish(pszId, ullInstanceId, ullMessageNumber, pszSessionId, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(7, this, "ptr", pszId, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * Determines whether a Probe message matches the specified host and sends a WS-Discovery ProbeMatches message if the match is made.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pProbeMessage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that represents the Probe message passed to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-probehandler">ProbeHandler</a>.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that represents the transmission parameters passed in to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-probehandler">ProbeHandler</a>.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion The current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted.  For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>. 
     * 
     * If <i>pTypesList</i> is specified, <b>MatchProbe</b> will use WS-Discovery matching logic to verify that the types in the list match the types specified in <i>pProbeMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains  hash values in string form. May be <b>NULL</b>.
     * 
     * If <i>pScopesList</i> is specified, <b>MatchProbe</b> will use WS-Discovery matching logic to verify that the scopes in the list match the scopes specified in <i>pProbeMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host. May be <b>NULL</b>.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li><i>pProbeMessage</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobe
     */
    MatchProbe(pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(8, this, "ptr", pProbeMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * Determines whether a Resolve message matches the specified host and sends a WS-Discovery ResolveMatches message if the match is made.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pResolveMessage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that represents the Resolve message passed in to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-resolvehandler">ResolveHandler</a>.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that represents the transmission parameters passed in to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-resolvehandler">ResolveHandler</a>.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion Current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted. For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>.  If <i>pTypesList</i> is specified, <b>MatchResolve</b> will use WS-Discovery matching logic to verify that the types match those specified in <i>pResolveMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains hash values in string form. May be <b>NULL</b>.  If <i>pScopesList</i> is specified, <b>MatchResolve</b>  will use WS-Discovery matching logic to verify that the scopes match those specified in <i>pResolveMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host.<i>pXAddrsList</i> and <i>pXAddrsList-&gt;Element</i> may not be <b>NULL</b>.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li><i>pProbeMessage</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolve
     */
    MatchResolve(pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(9, this, "ptr", pResolveMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * Announces the presence of a network host by sending a Hello message with extended information.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion Current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the WS-Discovery specification, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted. For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the WS-Discovery specification, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the WS-Discovery specification, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains hash values in string form. May be <b>NULL</b>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host. May be <b>NULL</b>.
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element to be inserted in the "ANY" section of the header.
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element to be inserted in the "ANY" section of the reference parameter properties.
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny Not used.
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the endpoint.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the message body.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_CALLBACK_ACTIVE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no registered notification sink. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-publishex
     */
    PublishEx(pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(10, this, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * Determines whether a Probe message matches the specified host and sends a WS-Discovery ProbeMatches message with extended information if the match is made.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pProbeMessage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that represents the Probe message passed to the notification sink's ProbeHandler.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that represents the transmission parameters passed in to the notification sink's ProbeHandler.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion Current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted.  For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>.
     * 
     * If <i>pTypesList</i> is specified, <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobe">MatchProbe</a> will use WS-Discovery matching logic to verify that the types in the list match the types specified in <i>pProbeMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains  hash values in string form. May be <b>NULL</b>.
     * 
     * If <i>pScopesList</i> is specified, <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobe">MatchProbe</a> will use WS-Discovery matching logic to verify that the scopes in the list match the scopes specified in <i>pProbeMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host. May be <b>NULL</b>.
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element to be inserted in the "ANY" section of the header.
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the reference parameter properties.
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny Not used.
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the endpoint.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the message body.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li><i>pProbeMessage</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobeex
     */
    MatchProbeEx(pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(11, this, "ptr", pProbeMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * Determines whether a Resolve message matches the specified host and sends a WS-Discovery ResolveMatches message with extended information if the match is made.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pResolveMessage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that represents the Resolve message passed in to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-resolvehandler">ResolveHandler</a>.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> object that represents the transmission parameters passed in to the notification sink's <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-resolvehandler">ResolveHandler</a>.
     * @param {PWSTR} pszId The logical or physical address of the device, which is used as the device endpoint address. A logical address is of the form <c>urn:uuid:{guid}</code>. A physical address can be a URI prefixed by http or https, or simply a URI prefixed by <code>uri</c>. Whenever possible, use a logical address.
     * @param {Integer} ullMetadataVersion Current metadata version.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullInstanceId Identifier for the current instance of the device being published. This identifier must be incremented whenever the service is restarted. For more information about instance identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {Integer} ullMessageNumber Counter within the scope of the instance identifier for the current message. The message number must be incremented for each message.
     * 
     * <div class="alert"><b>Note</b>  For compatibility with the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>, this value must be less than or equal to UINT_MAX (4294967295).</div>
     * <div> </div>
     * @param {PWSTR} pszSessionId Unique identifier within the scope of the instance identifier for the current session. This parameter corresponds to the sequence identifier in the AppSequence block in the Probe message. For more information about sequence identifiers, see Appendix I of the <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery specification</a>.
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<WSD_NAME_LIST>} pTypesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that represents the list of types supported by the publishing host. May be <b>NULL</b>.  If <i>pTypesList</i> is specified, <b>MatchResolveEx</b> will use WS-Discovery matching logic to verify that the types match those specified in <i>pResolveMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pScopesList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of matching scopes supported by the publishing host. The list contains hash values in string form. May be <b>NULL</b>.  If <i>pScopesList</i> is specified, <b>MatchResolveEx</b>  will use WS-Discovery matching logic to verify that the scopes match those specified in <i>pResolveMessage</i>.
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that represents the list of transport addresses supported by the publishing host. Each transport address string contains an address and port number which can be used for connection by a remote host. <i>pXAddrsList</i> and <i>pXAddrsList-&gt;Element</i> may not be <b>NULL</b>.
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element to be inserted in the "ANY" section of the header.
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element to be inserted in the "ANY" section of the reference parameter properties.
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny Not used.
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the endpoint.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains an XML element  to be inserted in the "ANY" section of the message body.
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
     * The method completed successfully.
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
     * One or more of the following conditions is true:
     * 
     * <ul>
     * <li><i>pszId</i> is <b>NULL</b>.</li>
     * <li>The length in characters of <i>pszId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li>The length in characters of <i>pszSessionId</i> exceeds WSD_MAX_TEXT_LENGTH (8192). </li>
     * <li><i>pProbeMessage</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher has not been started. Attaching a notification sink starts the publisher. To attach a sink, call <a href="/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink">RegisterNotificationSink</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolveex
     */
    MatchResolveEx(pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(12, this, "ptr", pResolveMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * Adds support for a custom scope matching rule.
     * @param {IWSDScopeMatchingRule} pScopeMatchingRule Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdscopematchingrule">IWSDScopeMatchingRule</a> object that represents a  custom scope matching rule.
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
     * The method completed successfully.
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
     * <i>pScopeMatchingRule</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-registerscopematchingrule
     */
    RegisterScopeMatchingRule(pScopeMatchingRule) {
        result := ComCall(13, this, "ptr", pScopeMatchingRule, "HRESULT")
        return result
    }

    /**
     * Removes support for a custom scope matching rule.
     * @param {IWSDScopeMatchingRule} pScopeMatchingRule Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdscopematchingrule">IWSDScopeMatchingRule</a> object that represents a custom scope matching rule.
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
     * The method completed successfully.
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
     * <i>pScopeMatchingRule</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-unregisterscopematchingrule
     */
    UnRegisterScopeMatchingRule(pScopeMatchingRule) {
        result := ComCall(14, this, "ptr", pScopeMatchingRule, "HRESULT")
        return result
    }

    /**
     * Gets the XML context associated with the device.
     * @returns {IWSDXMLContext} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that represents the XML context.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoverypublisher-getxmlcontext
     */
    GetXMLContext() {
        result := ComCall(15, this, "ptr*", &ppContext := 0, "HRESULT")
        return IWSDXMLContext(ppContext)
    }
}
