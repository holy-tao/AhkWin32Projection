#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_CONSTRAINT.ahk

/**
 * A security binding constraint that corresponds to the WS_SSL_TRANSPORT_SECURITY_BINDING.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_ssl_transport_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base binding constraint that this binding constraint derives from.
     *                 
     * 
     * There are no binding-specific properties are defined for this binding constraint
     *                     at this time.
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
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     * @type {Integer}
     */
    out {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
