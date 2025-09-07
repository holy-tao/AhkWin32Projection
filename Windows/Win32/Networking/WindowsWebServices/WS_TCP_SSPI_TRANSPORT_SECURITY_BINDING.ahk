#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of the Windows Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO) with the TCP transport.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     * @type {WS_SECURITY_BINDING}
     */
    binding{
        get {
            if(!this.HasProp("__binding"))
                this.__binding := WS_SECURITY_BINDING(this.ptr + 0)
            return this.__binding
        }
    }

    /**
     * The Windows Integrated Authentication credential to be used to
     * authenticate the client.  This is required on the client and must not
     * be specified on the server.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
