#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of the Windows Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO) with the named pipe transport.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_namedpipe_sspi_transport_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_binding">base type</a> from which this security binding subtype and all other security binding subtypes derive.
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
     * The <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential">WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a> structure to be used to authenticate the client. This is required on the client and must not be specified on the server.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
