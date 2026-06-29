#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The security binding subtype for specifying the use of the Windows Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO) with the named pipe transport.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_namedpipe_sspi_transport_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_binding">base type</a> from which this security binding subtype and all other security binding subtypes derive.
     */
    binding : WS_SECURITY_BINDING

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential">WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a> structure to be used to authenticate the client. This is required on the client and must not be specified on the server.
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
