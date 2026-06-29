#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT.ahk" { WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT }
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_ENDPOINT_ADDRESS.ahk" { WS_ENDPOINT_ADDRESS }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT.ahk" { WS_SECURITY_BINDING_CONSTRAINT }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }

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
 */
export default struct WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8


    struct _out {
        issuerAddress : WS_ENDPOINT_ADDRESS.Ptr

        requestSecurityTokenTemplate : WS_XML_BUFFER.Ptr

    }

    /**
     * The base binding constraint that this binding constraint derives from.
     *                 
     * 
     * There are currently no binding-specific properties defined for this binding constraint.
     */
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT

    /**
     * This specifies how the issued token should be attached to a message.
     */
    bindingUsage : WS_MESSAGE_SECURITY_USAGE

    /**
     * This field contains a list of claim types that 
     *                     are allowed in the policy.  Each claim type is 
     *                     a URI which identifies the type of claim.
     */
    claimConstraints : WS_XML_STRING.Ptr

    /**
     * The number of elements in the claimConstraints array.
     *                 
     * 
     * If this value is 0, then the claimConstraints array may be
     *                     <b>NULL</b>, and any claims are allowed to appear in the policy.
     */
    claimConstraintCount : UInt32

    /**
     * A set of property constraints relating to how to request a security token.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_request_security_token_property_constraint">WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT</a> for more information.
     */
    requestSecurityTokenPropertyConstraints : WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT.Ptr

    /**
     * The number of elements in the requestSecurityTokenPropertyConstraints array.
     *                 
     * 
     * If the array has zero elements, the requestSecurityTokenPropertyConstraints field may be <b>NULL</b>.
     */
    requestSecurityTokenPropertyConstraintCount : UInt32

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     */
    out : WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT._out

}
