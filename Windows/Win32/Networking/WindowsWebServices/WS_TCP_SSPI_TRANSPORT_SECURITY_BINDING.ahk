#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The security binding subtype for specifying the use of the Windows Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO) with the TCP transport.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING {
    #StructPack 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     */
    binding : WS_SECURITY_BINDING

    /**
     * The Windows Integrated Authentication credential to be used to
     * authenticate the client.  This is required on the client and must not
     * be specified on the server.
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
