#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_REQUEST_SECURITY_TOKEN_PROPERTY.ahk

/**
 * This structure is used to specify a set of constraints for a particular request security token property. Any property constraints that are not specified will use the default constraints.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_request_security_token_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _out extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {WS_REQUEST_SECURITY_TOKEN_PROPERTY}
         */
        requestSecurityTokenProperty{
            get {
                if(!this.HasProp("__requestSecurityTokenProperty"))
                    this.__requestSecurityTokenProperty := WS_REQUEST_SECURITY_TOKEN_PROPERTY(this.ptr + 0)
                return this.__requestSecurityTokenProperty
            }
        }
    
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
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of values which are acceptable.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the request security token property.  See the documentation for
     *                     a particular request security token property to determine the type of the
     *                     property.
     * @type {Pointer<Void>}
     */
    allowedValues {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The total size of the allowedValues array, in bytes.  This
     *                     size must be a multiple of the size of the type of the value
     *                     of the property.
     * @type {Integer}
     */
    allowedValuesSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     * @type {_out}
     */
    out{
        get {
            if(!this.HasProp("__out"))
                this.__out := %this.__Class%._out(this.ptr + 24)
            return this.__out
        }
    }
}
