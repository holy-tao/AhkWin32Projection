#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_BYTES.ahk" { WS_BYTES }
#Import ".\WS_ENDPOINT_IDENTITY_TYPE.ahk" { WS_ENDPOINT_IDENTITY_TYPE }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }

/**
 * Type for RSA endpoint identity.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_rsa_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_RSA_ENDPOINT_IDENTITY {
    #StructPack 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     */
    identity : WS_ENDPOINT_IDENTITY

    /**
     * The RSA key modulus of the endpoint that is represented by this endpoint identity.
     */
    modulus : WS_BYTES

    /**
     * The RSA key exponent of the endpoint that is represented by this endpoint identity.
     */
    exponent : WS_BYTES

}
