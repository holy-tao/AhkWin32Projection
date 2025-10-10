#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTY.ahk

/**
 * This structure is used to specify a set of constraints for a particular security binding property. Any property constraints that are not specified will use the default constraints.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_binding_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_BINDING_PROPERTY_CONSTRAINT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _out extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {WS_SECURITY_BINDING_PROPERTY}
         */
        securityBindingProperty{
            get {
                if(!this.HasProp("__securityBindingProperty"))
                    this.__securityBindingProperty := WS_SECURITY_BINDING_PROPERTY(this.ptr + 0)
                return this.__securityBindingProperty
            }
        }
    
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
     *                       <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_constraint_type">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE</a>security binding is specified.
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
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of values which are acceptable.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the security binding property.  See the documentation for
     *                     a particular security binding property to determine the type of the
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
     *                     fields of the property structure will be filled out as follows:
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
