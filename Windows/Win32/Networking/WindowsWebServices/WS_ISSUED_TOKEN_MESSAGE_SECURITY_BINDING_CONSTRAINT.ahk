#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_CONSTRAINT.ahk

/**
 * A security binding constraint that can be used to extract information about how to obtain an issued token from an issuing party.
 * @remarks
 * The information extracted using this binding constraint can be used
  *                 with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsrequestsecuritytoken">WsRequestSecurityToken</a> to obtain an issued token.
  *                 The issued token can then be used with the 
  *                 <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a> security binding.
  *             
  * 
  * This binding constraint is typically used in federated security
  *                 scenarios.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_issued_token_message_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    class _out extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Pointer<WS_ENDPOINT_ADDRESS>}
         */
        issuerAddress {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<IntPtr>}
         */
        requestSecurityTokenTemplate {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * The base binding constraint that this binding constraint derives from.
     *                 
     * 
     * There are currently no binding-specific properties defined for this binding constraint.
     * @type {WS_SECURITY_BINDING_CONSTRAINT}
     */
    bindingConstraint{
        get {
            if(!this.HasProp("__bindingConstraint"))
                this.__bindingConstraint := WS_SECURITY_BINDING_CONSTRAINT(this.ptr + 0)
            return this.__bindingConstraint
        }
    }

    /**
     * This specifies how the issued token should be attached to a message.
     * @type {Integer}
     */
    bindingUsage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * This field contains a list of claim types that 
     *                     are allowed in the policy.  Each claim type is 
     *                     a URI which identifies the type of claim.
     * @type {Pointer<WS_XML_STRING>}
     */
    claimConstraints {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of elements in the claimConstraints array.
     *                 
     * 
     * If this value is 0, then the claimConstraints array may be
     *                     <b>NULL</b>, and any claims are allowed to appear in the policy.
     * @type {Integer}
     */
    claimConstraintCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A set of property constraints relating to how to request a security token.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_request_security_token_property_constraint">WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT</a> for more information.
     * @type {Pointer<WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT>}
     */
    requestSecurityTokenPropertyConstraints {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of elements in the requestSecurityTokenPropertyConstraints array.
     *                 
     * 
     * If the array has zero elements, the requestSecurityTokenPropertyConstraints field may be <b>NULL</b>.
     * @type {Integer}
     */
    requestSecurityTokenPropertyConstraintCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     * @type {_out}
     */
    out{
        get {
            if(!this.HasProp("__out"))
                this.__out := %this.__Class%._out(this.ptr + 64)
            return this.__out
        }
    }
}
