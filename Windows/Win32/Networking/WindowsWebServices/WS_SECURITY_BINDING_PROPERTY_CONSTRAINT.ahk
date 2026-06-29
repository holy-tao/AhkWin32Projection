#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_PROPERTY_ID.ahk" { WS_SECURITY_BINDING_PROPERTY_ID }

/**
 * This structure is used to specify a set of constraints for a particular security binding property. Any property constraints that are not specified will use the default constraints.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_BINDING_PROPERTY_CONSTRAINT {
    #StructPack 8


    struct _out {
        securityBindingProperty : WS_SECURITY_BINDING_PROPERTY

    }

    /**
     * The id of the security binding property.  The following security
     *                     binding property constraints may be specified:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_SCHEME</a>
     * This property constraint may be specified when the
     *                       <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_constraint_type">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE</a> security binding is specified.
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_constraint_type">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_node_type">WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE</a> will be used.
     *                     
     * 
     * </li>
     * </ul>
     */
    id : WS_SECURITY_BINDING_PROPERTY_ID

    /**
     * An array of values which are acceptable.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the security binding property.  See the documentation for
     *                     a particular security binding property to determine the type of the
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
     *                     fields of the property structure will be filled out as follows:
     */
    out : WS_SECURITY_BINDING_PROPERTY_CONSTRAINT._out

}
