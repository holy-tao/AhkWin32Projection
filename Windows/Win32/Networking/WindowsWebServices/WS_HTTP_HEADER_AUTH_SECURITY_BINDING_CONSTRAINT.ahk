#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_CONSTRAINT.ahk

/**
 * A security binding constraint that corresponds to the WS_HTTP_HEADER_AUTH_SECURITY_BINDING.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_auth_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base binding constraint that this binding constraint derives from.
     * @type {WS_SECURITY_BINDING_CONSTRAINT}
     */
    bindingConstraint{
        get {
            if(!this.HasProp("__bindingConstraint"))
                this.__bindingConstraint := WS_SECURITY_BINDING_CONSTRAINT(0, this)
            return this.__bindingConstraint
        }
    }
}
