#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_POLICY_EXTENSION.ahk

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
 * @version v4.0.30319
 */
class WS_ENDPOINT_POLICY_EXTENSION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base policy extension that this policy extension derives from.
     * @type {WS_POLICY_EXTENSION}
     */
    policyExtension{
        get {
            if(!this.HasProp("__policyExtension"))
                this.__policyExtension := WS_POLICY_EXTENSION(this.ptr + 0)
            return this.__policyExtension
        }
    }

    /**
     * Name of the assertion to be retrieved as an extension.
     * @type {Pointer<WS_XML_STRING>}
     */
    assertionName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Namespace of the assertion to be retrieved as an extension.
     * @type {Pointer<WS_XML_STRING>}
     */
    assertionNs {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     fields of this structure will be filled out as follows:
     * @type {Pointer<_out_e__Struct>}
     */
    out {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
