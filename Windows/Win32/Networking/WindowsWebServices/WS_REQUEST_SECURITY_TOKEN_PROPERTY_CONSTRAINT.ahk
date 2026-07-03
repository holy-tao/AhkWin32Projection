#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_REQUEST_SECURITY_TOKEN_PROPERTY.ahk" { WS_REQUEST_SECURITY_TOKEN_PROPERTY }
#Import ".\WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID.ahk" { WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID }

/**
 * This structure is used to specify a set of constraints for a particular request security token property. Any property constraints that are not specified will use the default constraints.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_request_security_token_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT {
    #StructPack 8


    struct _out {
        requestSecurityTokenProperty : WS_REQUEST_SECURITY_TOKEN_PROPERTY

    }

    /**
     * The id of the request security token property.  The following security
     *                     property constraint may be specified:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_property_id">WS_REQUEST_SECURITY_TOKEN_PROPERTY_TRUST_VERSION</a>
     * This property indicates which WS-Trust versions are acceptable.
     *                     
     * 
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION_FEBRUARY_2005</a> will be used.
     *                     
     * 
     * Currently only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION_FEBRUARY_2005</a> is supported in policy, so a property constraint containing the
     *                         value <b>WS_TRUST_VERSION_FEBRUARY_2005</b> must be specified in
     *                         order for the policy to match.
     *                     
     * 
     * </li>
     * </ul>
     */
    id : WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID

    /**
     * An array of values which are acceptable.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the request security token property.  See the documentation for
     *                     a particular request security token property to determine the type of the
     *                     property.
     */
    allowedValues : IntPtr

    /**
     * The total size of the allowedValues array, in bytes.  This
     *                     size must be a multiple of the size of the type of the value
     *                     of the property.
     */
    allowedValuesSize : UInt32

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     */
    out : WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT._out

}
