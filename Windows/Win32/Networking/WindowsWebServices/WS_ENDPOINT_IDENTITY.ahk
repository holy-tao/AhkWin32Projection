#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ENDPOINT_IDENTITY_TYPE.ahk" { WS_ENDPOINT_IDENTITY_TYPE }

/**
 * The base type for all endpoint identities.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENDPOINT_IDENTITY {
    #StructPack 4

    /**
     * The selector for the type of the endpoint identity.
     */
    identityType : WS_ENDPOINT_IDENTITY_TYPE

}
