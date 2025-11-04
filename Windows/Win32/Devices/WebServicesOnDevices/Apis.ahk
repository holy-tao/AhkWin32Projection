#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WebServicesOnDevices {

;@region Constants

    /**
     * @type {String}
     */
    static WSD_DEFAULT_HOSTING_ADDRESS => "http://*:5357/"

    /**
     * @type {String}
     */
    static WSD_DEFAULT_SECURE_HOSTING_ADDRESS => "https://*:5358/"

    /**
     * @type {String}
     */
    static WSD_DEFAULT_EVENTING_ADDRESS => "http://*:5357/"

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_OPTION_TRACE_XML_TO_DEBUGGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_OPTION_TRACE_XML_TO_FILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_APPLY_DEFAULT_CHECKS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_IGNORE_REVOCATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_IGNORE_EXPIRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_SSL_CERT_IGNORE_INVALID_CN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_ADDRESSFAMILY_IPV4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSDAPI_ADDRESSFAMILY_IPV6 => 2
;@endregion Constants

;@region Methods
    /**
     * Retrieves a pointer to the IWSDUdpMessageParameters interface.
     * @param {Pointer<IWSDUdpMessageParameters>} ppTxParams Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdudpmessageparameters">IWSDUdpMessageParameters</a> interface that you use to specify how often WSD repeats the message transmission.
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
     * <i>ppTxParams</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-wsdcreateudpmessageparameters
     * @since windows6.0.6000
     */
    static WSDCreateUdpMessageParameters(ppTxParams) {
        result := DllCall("wsdapi.dll\WSDCreateUdpMessageParameters", "ptr*", ppTxParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDUdpAddress object.
     * @param {Pointer<IWSDUdpAddress>} ppAddress An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdudpaddress">IWSDUdpAddress</a> interface pointer. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>ppAddress</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-wsdcreateudpaddress
     * @since windows6.0.6000
     */
    static WSDCreateUdpAddress(ppAddress) {
        result := DllCall("wsdapi.dll\WSDCreateUdpAddress", "ptr*", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDHttpMessageParameters object.
     * @param {Pointer<IWSDHttpMessageParameters>} ppTxParams Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters">IWSDHttpMessageParameters</a> object. Cannot be <b>NULL</b>.
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
     * <i>ppTxParams</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-wsdcreatehttpmessageparameters
     * @since windows6.0.6000
     */
    static WSDCreateHttpMessageParameters(ppTxParams) {
        result := DllCall("wsdapi.dll\WSDCreateHttpMessageParameters", "ptr*", ppTxParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDHttpAddress object.
     * @param {Pointer<IWSDHttpAddress>} ppAddress Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpaddress">IWSDHttpAddress</a> object. Cannot be <b>NULL</b>.
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
     * <i>ppAddress</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-wsdcreatehttpaddress
     * @since windows6.0.6000
     */
    static WSDCreateHttpAddress(ppAddress) {
        result := DllCall("wsdapi.dll\WSDCreateHttpAddress", "ptr*", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDOutboundAttachment object.
     * @param {Pointer<IWSDOutboundAttachment>} ppAttachment Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsdattachment/nn-wsdattachment-iwsdoutboundattachment">IWSDOutboundAttachment</a> object. Cannot be <b>NULL</b>.
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
     * <i>attachmentOut</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdattachment/nf-wsdattachment-wsdcreateoutboundattachment
     * @since windows6.0.6000
     */
    static WSDCreateOutboundAttachment(ppAttachment) {
        result := DllCall("wsdapi.dll\WSDCreateOutboundAttachment", "ptr*", ppAttachment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a specified name from the built-in namespace.
     * @param {PWSTR} pszNamespace The namespace to match with a built-in namespace.
     * @param {PWSTR} pszName The name to match with a built-in name.
     * @param {Pointer<Pointer<WSDXML_NAME>>} ppName Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the returned built-in name.  The memory usage of <i>ppName</i> is managed elsewhere.  Consequently, the calling application should not attempt to deallocate <i>ppName</i>.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>pszNamespace</i> is <b>NULL</b>, <i>pszName</i> is <b>NULL</b>, the length in characters of <i>pszNamespace</i> exceeds WSD_MAX_TEXT_LENGTH (8192), the length in characters of <i>pszName</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or there was no matching name in the built-in namespace.
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
     * <i>ppName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-wsdxmlgetnamefrombuiltinnamespace
     * @since windows6.0.6000
     */
    static WSDXMLGetNameFromBuiltinNamespace(pszNamespace, pszName, ppName) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppNameMarshal := ppName is VarRef ? "ptr*" : "ptr"

        result := DllCall("wsdapi.dll\WSDXMLGetNameFromBuiltinNamespace", "ptr", pszNamespace, "ptr", pszName, ppNameMarshal, ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new IWSDXMLContext object.
     * @param {Pointer<IWSDXMLContext>} ppContext Pointer to a newly allocated 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object. If the function fails, 
     *       this parameter can be <b>NULL</b>.
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
     * <i>ppContext</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-wsdxmlcreatecontext
     * @since windows6.0.6000
     */
    static WSDXMLCreateContext(ppContext) {
        result := DllCall("wsdapi.dll\WSDXMLCreateContext", "ptr*", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDiscoveryProvider object.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDiscoveryProvider>} ppProvider Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> object. Cannot be <b>NULL</b>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-wsdcreatediscoveryprovider
     * @since windows6.0.6000
     */
    static WSDCreateDiscoveryProvider(pContext, ppProvider) {
        result := DllCall("wsdapi.dll\WSDCreateDiscoveryProvider", "ptr", pContext, "ptr*", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDiscoveryProvider object that supports signed messages.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces.
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<WSD_CONFIG_PARAM>} pConfigParams An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structures that contain the parameters for creating the object.
     * @param {Integer} dwConfigParamCount The total number of structures passed in <i>pConfigParams</i>.
     * @param {Pointer<IWSDiscoveryProvider>} ppProvider Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> object. Cannot be <b>NULL</b>.
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
     * Function completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-wsdcreatediscoveryprovider2
     * @since windows6.1
     */
    static WSDCreateDiscoveryProvider2(pContext, pConfigParams, dwConfigParamCount, ppProvider) {
        result := DllCall("wsdapi.dll\WSDCreateDiscoveryProvider2", "ptr", pContext, "ptr", pConfigParams, "uint", dwConfigParamCount, "ptr*", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDiscoveryPublisher object.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDiscoveryPublisher>} ppPublisher Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoverypublisher">IWSDiscoveryPublisher</a> object. Cannot be <b>NULL</b>.
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
     * <i>ppPublisher</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-wsdcreatediscoverypublisher
     * @since windows6.0.6000
     */
    static WSDCreateDiscoveryPublisher(pContext, ppPublisher) {
        result := DllCall("wsdapi.dll\WSDCreateDiscoveryPublisher", "ptr", pContext, "ptr*", ppPublisher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IWSDiscoveryPublisher object that supports signed messages.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces.
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<WSD_CONFIG_PARAM>} pConfigParams An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structures that contain the parameters for creating the object.
     * @param {Integer} dwConfigParamCount The total number of structures passed in <i>pConfigParams</i>.
     * @param {Pointer<IWSDiscoveryPublisher>} ppPublisher Returns a reference to the initialized <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoverypublisher">IWSDiscoveryPublisher</a> object. Cannot be <b>NULL</b>.
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
     * Function completed successfully.
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
     * <i>ppPublisher</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-wsdcreatediscoverypublisher2
     * @since windows6.1
     */
    static WSDCreateDiscoveryPublisher2(pContext, pConfigParams, dwConfigParamCount, ppPublisher) {
        result := DllCall("wsdapi.dll\WSDCreateDiscoveryPublisher2", "ptr", pContext, "ptr", pConfigParams, "uint", dwConfigParamCount, "ptr*", ppPublisher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device proxy and returns a pointer to the IWSDDeviceProxy interface.
     * @param {PWSTR} pszDeviceId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. A physical address is a URI prefixed by http or https. If this address is a URI prefixed by https, then the proxy will use the SSL/TLS protocol.
     * 
     * The device address may be prefixed with the @ character. When <i>pszDeviceId</i> begins with @, this function does not retrieve the device metadata when creating the device proxy.
     * @param {PWSTR} pszLocalId The logical or physical address of the client, which is used to identify the proxy and to act as an event sink endpoint. A logical address is of the form <c>urn:uuid:{guid}</c>. 
     * 
     * If the client uses a secure channel to receive events, then the address is a URI prefixed by https. This URI should specify port 5358, as this port is reserved for secure connections with WSDAPI. The port must be configured with an SSL server certificate before calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxyadvanced">WSDCreateDeviceProxyAdvanced</a>. For more information about port configuration, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDDeviceProxy>} ppDeviceProxy Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsddeviceproxy">IWSDDeviceProxy</a> object that you use to represent a remote WSD device for client applications and middleware.
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
     * <i>pszDeviceId</i> is <b>NULL</b>, <i>pszLocalId</i> is <b>NULL</b>, the length in characters of <i>pszDeviceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or the length in characters of  <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
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
     * <i>ppDeviceProxy</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-wsdcreatedeviceproxy
     * @since windows6.0.6000
     */
    static WSDCreateDeviceProxy(pszDeviceId, pszLocalId, pContext, ppDeviceProxy) {
        pszDeviceId := pszDeviceId is String ? StrPtr(pszDeviceId) : pszDeviceId
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceProxy", "ptr", pszDeviceId, "ptr", pszLocalId, "ptr", pContext, "ptr*", ppDeviceProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device proxy and returns a pointer to the IWSDDeviceProxy interface.
     * @param {PWSTR} pszDeviceId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. A physical address is a URI prefixed by http or https. If this address is a URI prefixed by https, then the proxy will use the SSL/TLS protocol. 
     * 
     * If either <i>pszDeviceId</i> or the <i>pszLocalId</i> is an URL prefixed by https, then both URLs must be identical. If this is not the case, <b>WSDCreateDeviceProxyAdvanced</b> will return E_INVALIDARG. 
     * 
     * The device address may be prefixed with the @ character. When <i>pszDeviceId</i> begins with @, this function does not retrieve the device metadata when creating the device proxy.
     * @param {IWSDAddress} pDeviceAddress An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface that defines the device transport address. When <i>pDeviceAddress</i> is specified, a device proxy can be created without requiring the resolution of a logical address passed to <i>pszDeviceId</i>. This parameter may be <b>NULL</b>.
     * @param {PWSTR} pszLocalId The logical or physical address of the client, which is used to identify the proxy and to act as an event sink endpoint. A logical address is of the form <c>urn:uuid:{guid}</c>. 
     * 
     * If the client uses a secure channel to receive events, then the address is a URI prefixed by https. This URI should specify port 5358, as this port is reserved for secure connections with WSDAPI. The port must be configured with an SSL server certificate before calling <b>WSDCreateDeviceProxyAdvanced</b>. For more information about port configuration, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDDeviceProxy>} ppDeviceProxy Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsddeviceproxy">IWSDDeviceProxy</a> interface that you use to represent a remote WSD device for client applications and middleware.
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
     * <i>pszDeviceId</i> is <b>NULL</b>, <i>pszLocalId</i> is <b>NULL</b>, the length in characters of <i>pszDeviceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), the length in characters of <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pszDeviceId</i> points to a URI prefixed by https and that URL does not match the URI passed to <i>pszLocalId</i>.
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
     * <i>ppDeviceProxy</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-wsdcreatedeviceproxyadvanced
     * @since windows6.0.6000
     */
    static WSDCreateDeviceProxyAdvanced(pszDeviceId, pDeviceAddress, pszLocalId, pContext, ppDeviceProxy) {
        pszDeviceId := pszDeviceId is String ? StrPtr(pszDeviceId) : pszDeviceId
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceProxyAdvanced", "ptr", pszDeviceId, "ptr", pDeviceAddress, "ptr", pszLocalId, "ptr", pContext, "ptr*", ppDeviceProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device proxy that can support signed messages and returns a pointer to the IWSDDeviceProxy interface.
     * @param {PWSTR} pszDeviceId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. A physical address is a URI prefixed by http or https. If this address is a URI prefixed by https, then the proxy will use the SSL/TLS protocol.
     * 
     * The device address may be prefixed with the @ character. When <i>pszDeviceId</i> begins with @, this function does not retrieve the device metadata when creating the device proxy.
     * @param {PWSTR} pszLocalId The logical or physical address of the client, which is used to identify the proxy and to act as an event sink endpoint. A logical address is of the form <c>urn:uuid:{guid}</c>. 
     * 
     * If the client uses a secure channel to receive events, then the address is a URI prefixed by https. This URI should specify port 5358, as this port is reserved for secure connections with WSDAPI. The port must be configured with an SSL server certificate before calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxyadvanced">WSDCreateDeviceProxyAdvanced</a>. For more information about port configuration, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<WSD_CONFIG_PARAM>} pConfigParams An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structures that contain the parameters for creating the object.
     * @param {Integer} dwConfigParamCount The total number of structures passed in <i>pConfigParams</i>.
     * @param {Pointer<IWSDDeviceProxy>} ppDeviceProxy Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsddeviceproxy">IWSDDeviceProxy</a> object that you use to represent a remote WSD device for client applications and middleware.
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
     * Function completed successfully.
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
     * <i>pszDeviceId</i> is <b>NULL</b>, <i>pszLocalId</i> is <b>NULL</b>, the length in characters of <i>pszDeviceId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or the length in characters of  <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
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
     * <i>ppDeviceProxy</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-wsdcreatedeviceproxy2
     * @since windows6.1
     */
    static WSDCreateDeviceProxy2(pszDeviceId, pszLocalId, pContext, pConfigParams, dwConfigParamCount, ppDeviceProxy) {
        pszDeviceId := pszDeviceId is String ? StrPtr(pszDeviceId) : pszDeviceId
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceProxy2", "ptr", pszDeviceId, "ptr", pszLocalId, "ptr", pContext, "ptr", pConfigParams, "uint", dwConfigParamCount, "ptr*", ppDeviceProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device host and returns a pointer to the IWSDDeviceHost interface.
     * @param {PWSTR} pszLocalId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. If <i>pszLocalId</i> is a logical address, the host will announce the logical address and then convert the address to a physical address when it receives Resolve or Probe messages.
     * 
     * 
     * If <i>pszLocalId</i> is a physical address (such as  URL prefixed by http or https), the host will use the address as the physical address and will host on that address instead of the default one.
     * 
     * 
     * For secure communication, <i>pszLocalId</i> must be an URL prefixed by https, and the host will use the SSL/TLS protocol on the port specified in the URL.  The recommended port is port 5358, as this port is reserved for secure connections with WSDAPI.
     * If no port is specified, then the host will use port 443. The host port must be configured with an SSL server certificate before calling <b>WSDCreateDeviceHost</b>.  For more information about the configuration of host ports, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
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
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that defines custom message types or namespaces. 
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDDeviceHost>} ppDeviceHost Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nn-wsdhost-iwsddevicehost">IWSDDeviceHost</a> object that you use to expose the WSD-specific device semantics associated with a server that responds to incoming requests.
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
     * <i>pszLocalId</i> is <b>NULL</b> or the length in characters of <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
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
     * <i>ppDeviceHost</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-wsdcreatedevicehost
     * @since windows6.0.6000
     */
    static WSDCreateDeviceHost(pszLocalId, pContext, ppDeviceHost) {
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceHost", "ptr", pszLocalId, "ptr", pContext, "ptr*", ppDeviceHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device host and returns a pointer to the IWSDDeviceHost interface.
     * @param {PWSTR} pszLocalId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. If <i>pszLocalId</i> is a logical address, the host will announce the logical address and then convert the address to a physical address when it receives Resolve or Probe messages.
     * 
     * If <i>pszLocalId</i> is a physical address (such as  URL prefixed by http or https), the host will use the address as the physical address and will host on that address instead of the default one.
     * 
     * 
     * For secure communication, <i>pszLocalId</i> must be an URL prefixed by https, and the host will use the SSL/TLS protocol on the port specified in the URL.  The recommended port is port 5358, as this port is reserved for secure connections with WSDAPI.
     * If no port is specified, then the host will use port 443. The host port must be configured with an SSL server certificate before calling <b>WSDCreateDeviceHostAdvanced</b>.  For more information about the configuration of host ports, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
     * 
     * 
     * If either <i>pszLocalId</i> or the transport address referenced by <i>ppHostAddresses</i> is an URL prefixed by https, then both URLs must be identical. If this is not the case, <b>WSDCreateDeviceHostAdvanced</b> will return E_INVALIDARG. 
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
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<IWSDAddress>} ppHostAddresses A single <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface or <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdtransportaddress">IWSDTransportAddress</a> interface. The objects provide information about specific addresses that the host should listen on.
     * 
     * If <i>pszLocalId</i> contains a logical address, the resulting behavior is a mapping between the logical address and a specific set of physical addresses (instead of a mapping between the logical address and a default physical address).
     * @param {Integer} dwHostAddressCount The number of items in the <i>ppHostAddresses</i> array. If <i>ppHostAddresses</i> is an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface, count must be 1.
     * @param {Pointer<IWSDDeviceHost>} ppDeviceHost Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nn-wsdhost-iwsddevicehost">IWSDDeviceHost</a> interface that you use to expose the WSD-specific device semantics associated with a server that responds to incoming requests.
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
     * <i>pszLocalId</i> is <b>NULL</b>, the length in characters of <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pszLocalId</i> points to an URL prefixed by https and that URL does not match the URL of the transport address referenced by <i>ppHostAddresses</i>.
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
     * <i>ppDeviceHost</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-wsdcreatedevicehostadvanced
     * @since windows6.0.6000
     */
    static WSDCreateDeviceHostAdvanced(pszLocalId, pContext, ppHostAddresses, dwHostAddressCount, ppDeviceHost) {
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceHostAdvanced", "ptr", pszLocalId, "ptr", pContext, "ptr*", ppHostAddresses, "uint", dwHostAddressCount, "ptr*", ppDeviceHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a device host that can support signed messages and returns a pointer to the IWSDDeviceHost interface.
     * @param {PWSTR} pszLocalId The logical or physical address of the device. A logical address is of the form <c>urn:uuid:{guid}</c>. If <i>pszLocalId</i> is a logical address, the host will announce the logical address and then convert the address to a physical address when it receives Resolve or Probe messages.
     * 
     * If <i>pszLocalId</i> is a physical address (such as  URL prefixed by http or https), the host will use the address as the physical address and will host on that address instead of the default one.
     * 
     * If <i>pszLocalId</i> is an HTTPS URL, the recommended port is port 5358, as this port is reserved for secure connections with WSDAPI.
     * If no port is specified, then the host will use port 443. The host port must be configured with an SSL server certificate before calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehost">WSDCreateDeviceHost</a>.  For more information about the configuration of host ports, see <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>.
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
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> object that defines custom message types or namespaces.
     * 
     * If <b>NULL</b>, a default context representing the built-in message types and namespaces is used.
     * @param {Pointer<WSD_CONFIG_PARAM>} pConfigParams An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structures that contain the parameters for creating the object.
     * @param {Integer} dwConfigParamCount The total number of structures passed in <i>pConfigParams</i>.
     * @param {Pointer<IWSDDeviceHost>} ppDeviceHost Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nn-wsdhost-iwsddevicehost">IWSDDeviceHost</a> object that you use to expose the WSD-specific device semantics associated with a server that responds to incoming requests.
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
     * Function completed successfully.
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
     * <i>pszLocalId</i> is <b>NULL</b> or the length in characters of <i>pszLocalId</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
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
     * <i>ppDeviceHost</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nf-wsdhost-wsdcreatedevicehost2
     * @since windows6.1
     */
    static WSDCreateDeviceHost2(pszLocalId, pContext, pConfigParams, dwConfigParamCount, ppDeviceHost) {
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := DllCall("wsdapi.dll\WSDCreateDeviceHost2", "ptr", pszLocalId, "ptr", pContext, "ptr", pConfigParams, "uint", dwConfigParamCount, "ptr*", ppDeviceHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a WSDAPI configuration option.
     * @param {Integer} dwOption The type of configuration data to set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE"></a><a id="wsdapi_option_max_inbound_message_size"></a><dl>
     * <dt><b>WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set the maximum size, in bytes, of an inbound message. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pVoid Pointer to the configuration data. If <i>dwOption</i> is set to WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE, then <i>pVoid</i> should point to a DWORD that represents the  size of an inbound message. The size of the message is  a value between 32768 and 1048576.
     * @param {Integer} cbInBuffer The size, in bytes, of the data pointed to by <i>pVoid</i>. If <i>dwOption</i> is set to WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE, this parameter should be set to <c>sizeof(DWORD)</c>.
     * @returns {HRESULT} This function can return one of these values.
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
     * The <i>dwOption</i> is not set to WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE, <i>cbInBuffer</i> is 0, <i>cbInBuffer</i> is not the correct size for the type of configuration data, or <i>pVoid</i> is NULL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdsetconfigurationoption
     * @since windows6.0.6000
     */
    static WSDSetConfigurationOption(dwOption, pVoid, cbInBuffer) {
        result := DllCall("wsdapi.dll\WSDSetConfigurationOption", "uint", dwOption, "ptr", pVoid, "uint", cbInBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a WSDAPI configuration option.
     * @param {Integer} dwOption The type of configuration data to get.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE"></a><a id="wsdapi_option_max_inbound_message_size"></a><dl>
     * <dt><b>WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the maximum size, in bytes, of an inbound message. This message size is  a value between 32768 and 1048576.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pVoid Pointer to the configuration data.
     * @param {Integer} cbOutBuffer The size, in bytes, of the data pointed to by <i>pVoid</i>. If <i>dwOption</i> is set to WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE, then this parameter should be set to <c>sizeof(DWORD)</c>.
     * @returns {HRESULT} This function can return one of these values.
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
     * The <i>dwOption</i> is not set to WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE, <i>cbOutBuffer</i> is 0, or <i>cbOutBuffer</i> is not the correct size for the type of configuration data.
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
     * <i>pVoid</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdgetconfigurationoption
     * @since windows6.0.6000
     */
    static WSDGetConfigurationOption(dwOption, pVoid, cbOutBuffer) {
        result := DllCall("wsdapi.dll\WSDGetConfigurationOption", "uint", dwOption, "ptr", pVoid, "uint", cbOutBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a linked memory block.
     * @param {Pointer<Void>} pParent Pointer to the parent memory block.
     * @param {Pointer} cbSize Size of the memory block to be allocated.
     * @returns {Pointer<Void>} Pointer to the newly allocated memory block.
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdallocatelinkedmemory
     * @since windows6.0.6000
     */
    static WSDAllocateLinkedMemory(pParent, cbSize) {
        pParentMarshal := pParent is VarRef ? "ptr" : "ptr"

        result := DllCall("wsdapi.dll\WSDAllocateLinkedMemory", pParentMarshal, pParent, "ptr", cbSize, "ptr")
        return result
    }

    /**
     * Frees a memory block previously allocated with WSDAllocateLinkedMemory.
     * @remarks
     * 
     * All children of the memory block are automatically freed.
     * 
     * @param {Pointer<Void>} pVoid Pointer to the memory block to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdfreelinkedmemory
     * @since windows6.0.6000
     */
    static WSDFreeLinkedMemory(pVoid) {
        pVoidMarshal := pVoid is VarRef ? "ptr" : "ptr"

        DllCall("wsdapi.dll\WSDFreeLinkedMemory", pVoidMarshal, pVoid)
    }

    /**
     * Attaches a child memory block to a parent memory block.
     * @remarks
     * 
     * The child memory block is automatically freed when the parent memory
     * block is freed. Both the parent and child memory blocks must have been previously allocated by calls to <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdallocatelinkedmemory">WSDAllocateLinkedMemory</a>.
     * 
     * @param {Pointer<Void>} pParent Pointer to the parent memory block.
     * @param {Pointer<Void>} pChild Pointer to the child memory block.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdattachlinkedmemory
     * @since windows6.0.6000
     */
    static WSDAttachLinkedMemory(pParent, pChild) {
        pParentMarshal := pParent is VarRef ? "ptr" : "ptr"
        pChildMarshal := pChild is VarRef ? "ptr" : "ptr"

        DllCall("wsdapi.dll\WSDAttachLinkedMemory", pParentMarshal, pParent, pChildMarshal, pChild)
    }

    /**
     * Detaches a child memory block from its parent memory block.
     * @remarks
     * 
     * The child memory block must have been previously allocated by a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdallocatelinkedmemory">WSDAllocateLinkedMemory</a>.
     * 
     * @param {Pointer<Void>} pVoid Pointer to the memory block to be detached.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsddetachlinkedmemory
     * @since windows6.0.6000
     */
    static WSDDetachLinkedMemory(pVoid) {
        pVoidMarshal := pVoid is VarRef ? "ptr" : "ptr"

        DllCall("wsdapi.dll\WSDDetachLinkedMemory", pVoidMarshal, pVoid)
    }

    /**
     * Creates an XML element with a specified name and value.
     * @param {Pointer<WSDXML_NAME>} pElementName Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the name of the  created element.
     * @param {PWSTR} pszText The text value of the created element.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> that contains the created element.  <i>ppAny</i> must be freed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>pElementName</i> is <b>NULL</b> or the length in characters of <i>pszText</i> exceeds WSD_MAX_TEXT_LENGTH (8192).
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
     * <i>ppAny</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdxmlbuildanyforsingleelement
     * @since windows6.0.6000
     */
    static WSDXMLBuildAnyForSingleElement(pElementName, pszText, ppAny) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := DllCall("wsdapi.dll\WSDXMLBuildAnyForSingleElement", "ptr", pElementName, "ptr", pszText, ppAnyMarshal, ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a text value from a specified child element of an XML any element.
     * @param {PWSTR} pszNamespace The namespace of the element to retrieve.
     * @param {PWSTR} pszName The name of the element to retrieve.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains the <b>any</b> element that is the parent of the element to retrieve.
     * @param {Pointer<PWSTR>} ppszValue The text value of the element specified by <i>pszNamespace</i> and <i>pszName</i>.  The memory usage of <i>ppszValue</i> is managed elsewhere.  Consequently, the calling application should not attempt to deallocate <i>ppszValue</i>.
     * @returns {HRESULT} This function can return one of these values.
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
     * The length in characters of <i>pszNamespace</i> or <i>pszName</i> exceeds WSD_MAX_TEXT_LENGTH (8192), or <i>pAny</i> is <b>NULL</b>. 
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
     * <i>ppszValue</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdxmlgetvaluefromany
     * @since windows6.0.6000
     */
    static WSDXMLGetValueFromAny(pszNamespace, pszName, pAny, ppszValue) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("wsdapi.dll\WSDXMLGetValueFromAny", "ptr", pszNamespace, "ptr", pszName, "ptr", pAny, "ptr", ppszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a sibling element.
     * @param {Pointer<WSDXML_ELEMENT>} pFirst Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains the first sibling.
     * @param {Pointer<WSDXML_ELEMENT>} pSecond Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains the second sibling.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>pFirst</i> or <i>pSecond</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdxmladdsibling
     * @since windows6.0.6000
     */
    static WSDXMLAddSibling(pFirst, pSecond) {
        result := DllCall("wsdapi.dll\WSDXMLAddSibling", "ptr", pFirst, "ptr", pSecond, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a child element.
     * @param {Pointer<WSDXML_ELEMENT>} pParent Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains the parent element.
     * @param {Pointer<WSDXML_ELEMENT>} pChild Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains the child element.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>pParent</i> is <b>NULL</b>, <i>pChild</i> is <b>NULL</b>, <i>pChild</i> already has a parent, or a sibling could not be added to an existing child of <i>pParent</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdxmladdchild
     * @since windows6.0.6000
     */
    static WSDXMLAddChild(pParent, pChild) {
        result := DllCall("wsdapi.dll\WSDXMLAddChild", "ptr", pParent, "ptr", pChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory associated with an XML element.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @returns {HRESULT} This function can return one of these values.
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
     * <i>pAny</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdxmlcleanupelement
     * @since windows6.0.6000
     */
    static WSDXMLCleanupElement(pAny) {
        result := DllCall("wsdapi.dll\WSDXMLCleanupElement", "ptr", pAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Generates a SOAP fault.
     * @param {PWSTR} pszCode A SOAP fault code.
     * 
     * 
     * The list of possible fault codes follows. For a description of each fault code, see the <a href="https://www.w3.org/TR/2003/REC-soap12-part1-20030624/#faultcodes">SOAP Version 1.2 specification</a>.
     * 
     * 
     * 
     * <a id="VersionMismatch"></a>
     * <a id="versionmismatch"></a>
     * <a id="VERSIONMISMATCH"></a>
     * @param {PWSTR} pszSubCode A fault subcode.
     * @param {PWSTR} pszReason A human readable explanation of the fault.
     * @param {PWSTR} pszDetail Contains application-specific error information pertaining to the fault.
     * @param {IWSDXMLContext} pContext An <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nn-wsdxml-iwsdxmlcontext">IWSDXMLContext</a> interface that represents the context in which to generate the fault.
     * @param {Pointer<Pointer<WSD_SOAP_FAULT>>} ppFault A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault">WSD_SOAP_FAULT</a> structure that contains the generated fault.  When the calling application is done with this data, <i>ppFault</i> must be freed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
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
     * <i>pszCode</i>, <i>pszReason</i>, or <i>pContext</i> is <b>NULL</b>.
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
     * <i>ppFault</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdgeneratefault
     * @since windows6.0.6000
     */
    static WSDGenerateFault(pszCode, pszSubCode, pszReason, pszDetail, pContext, ppFault) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszSubCode := pszSubCode is String ? StrPtr(pszSubCode) : pszSubCode
        pszReason := pszReason is String ? StrPtr(pszReason) : pszReason
        pszDetail := pszDetail is String ? StrPtr(pszDetail) : pszDetail

        ppFaultMarshal := ppFault is VarRef ? "ptr*" : "ptr"

        result := DllCall("wsdapi.dll\WSDGenerateFault", "ptr", pszCode, "ptr", pszSubCode, "ptr", pszReason, "ptr", pszDetail, "ptr", pContext, ppFaultMarshal, ppFault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Generates a SOAP fault.
     * @param {Pointer<WSDXML_NAME>} pCode A SOAP fault code.
     * 
     * 
     * The list of possible fault codes follows. For a description of each fault code, see the 
     * 
     * <a href="https://www.w3.org/TR/2003/REC-soap12-part1-20030624/#faultcodes">SOAP Version 1.2 specification</a>.
     * 
     * 
     * 
     * <a id="VersionMismatch"></a>
     * <a id="versionmismatch"></a>
     * <a id="VERSIONMISMATCH"></a>
     * @param {Pointer<WSDXML_NAME>} pSubCode A fault subcode.
     * @param {Pointer<WSD_LOCALIZED_STRING_LIST>} pReasons A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains a list of localized reason codes.
     * @param {PWSTR} pszDetail Contains application-specific error information pertaining to the fault.
     * @param {Pointer<Pointer<WSD_SOAP_FAULT>>} ppFault A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault">WSD_SOAP_FAULT</a> structure that contains the generated fault.  <i>ppFault</i> must be freed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
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
     * <i>pszCode</i> or <i>pReasons</i> is <b>NULL</b>.
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
     * <i>ppFault</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsdgeneratefaultex
     * @since windows6.0.6000
     */
    static WSDGenerateFaultEx(pCode, pSubCode, pReasons, pszDetail, ppFault) {
        pszDetail := pszDetail is String ? StrPtr(pszDetail) : pszDetail

        ppFaultMarshal := ppFault is VarRef ? "ptr*" : "ptr"

        result := DllCall("wsdapi.dll\WSDGenerateFaultEx", "ptr", pCode, "ptr", pSubCode, "ptr", pReasons, "ptr", pszDetail, ppFaultMarshal, ppFault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encodes a URI according to URI encoding rules in RFC2396.
     * @param {PWSTR} source Contains the URI to be encoded.
     * @param {Integer} cchSource Specifies the length of <i>source</i> in characters.
     * @param {Pointer<PWSTR>} destOut Pointer to a string that contains the encoded URI.  If <i>destOut</i> is not <b>NULL</b>, the calling application should free the allocated string by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @param {Pointer<Integer>} cchDestOut Specifies the length of <i>destOut</i> in characters.
     * @returns {HRESULT} This function can return one of these values.
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
     * Function completed successfully.
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
     * <i>source</i> is <b>NULL</b> or <i>cchSource</i> is 0.
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
     * The length in characters of <i>source</i> exceeds <b>WSD_MAX_TEXT_LENGTH</b> (8192).
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
     * <i>destOut</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsduriencode
     * @since windows6.1
     */
    static WSDUriEncode(source, cchSource, destOut, cchDestOut) {
        source := source is String ? StrPtr(source) : source

        cchDestOutMarshal := cchDestOut is VarRef ? "uint*" : "ptr"

        result := DllCall("wsdapi.dll\WSDUriEncode", "ptr", source, "uint", cchSource, "ptr", destOut, cchDestOutMarshal, cchDestOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decodes a URI according to the rules in RFC2396.
     * @param {PWSTR} source Contains the URI to be decoded.
     * @param {Integer} cchSource Specifies the length of <i>source</i> in characters.
     * @param {Pointer<PWSTR>} destOut Pointer to a string that contains the decoded URI.  If <i>destOut</i> is not <b>NULL</b>, the calling application should free the allocated string by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>.
     * @param {Pointer<Integer>} cchDestOut Specifies the length of <i>destOut</i> in characters.
     * @returns {HRESULT} This function can return one of these values.
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
     * Function completed successfully.
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
     * <i>source</i> is <b>NULL</b> or <i>cchSource</i> is 0.
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
     * The length in characters of <i>source</i> exceeds <b>WSD_MAX_TEXT_LENGTH</b> (8192).
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
     * <i>destOut</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdutil/nf-wsdutil-wsduridecode
     * @since windows6.1
     */
    static WSDUriDecode(source, cchSource, destOut, cchDestOut) {
        source := source is String ? StrPtr(source) : source

        cchDestOutMarshal := cchDestOut is VarRef ? "uint*" : "ptr"

        result := DllCall("wsdapi.dll\WSDUriDecode", "ptr", source, "uint", cchSource, "ptr", destOut, cchDestOutMarshal, cchDestOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
