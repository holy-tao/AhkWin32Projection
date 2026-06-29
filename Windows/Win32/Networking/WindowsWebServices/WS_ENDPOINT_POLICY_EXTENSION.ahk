#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_POLICY_EXTENSION_TYPE.ahk" { WS_POLICY_EXTENSION_TYPE }
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }
#Import ".\WS_POLICY_EXTENSION.ahk" { WS_POLICY_EXTENSION }

/**
 * This structure is used to specify an endpoint policy extension.
 * @remarks
 * This extension can be used to specify a custom assertion or an assertion that is
 *               supported by this library so that the application can
 *               retrieve the original XML form of the assertion. If one of the supported assertions
 *               is specified as an extension, the corresponding constraint should not be specified.
 *               For example, if http://schemas.xmlsoap.org/ws/2005/07/securitypolicy:TransportBinding
 *               is specified as an endpoint extension, <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ssl_transport_security_binding_constraint">WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a> cannot be specified as a constraint.
 *           
 * 
 * The following assertions are not allowed as policy extension because they might affect constraint 
 *               matching result if the assertion is handled as assertion. 
 * 
 * 
 * ``` syntax
 * 
 * &lt;wsa09p:UsingAddressing.../&gt;
 * &lt;wsa10p:UsingAddressing.../&gt;
 * &lt;binp:BinaryEncoding.../&gt;
 * &lt;mtomp:OptimizedMimeSerialization.../&gt;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_policy_extension
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENDPOINT_POLICY_EXTENSION {
    #StructPack 8


    struct _out {
        assertionValue : WS_XML_BUFFER.Ptr

    }

    /**
     * The base policy extension that this policy extension derives from.
     */
    policyExtension : WS_POLICY_EXTENSION

    /**
     * Name of the assertion to be retrieved as an extension.
     */
    assertionName : WS_XML_STRING.Ptr

    /**
     * Namespace of the assertion to be retrieved as an extension.
     */
    assertionNs : WS_XML_STRING.Ptr

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     fields of this structure will be filled out as follows:
     */
    out : WS_ENDPOINT_POLICY_EXTENSION._out

}
