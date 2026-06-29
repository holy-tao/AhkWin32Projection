#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SERVICE_ENDPOINT_PROPERTY.ahk" { WS_SERVICE_ENDPOINT_PROPERTY }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_CHANNEL_TYPE.ahk" { WS_CHANNEL_TYPE }
#Import ".\WS_CHANNEL_BINDING.ahk" { WS_CHANNEL_BINDING }
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_SECURITY_DESCRIPTION.ahk" { WS_SECURITY_DESCRIPTION }
#Import ".\WS_ENDPOINT_ADDRESS.ahk" { WS_ENDPOINT_ADDRESS }
#Import ".\WS_SERVICE_CONTRACT.ahk" { WS_SERVICE_CONTRACT }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }

/**
 * Represents an individual endpoint on a service host. The properties on the endpoint are used to specify the address, binding and contract.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_ENDPOINT {
    #StructPack 8

    /**
     * The URL address on which the endpoint is going to listen.
     */
    address : WS_ENDPOINT_ADDRESS

    /**
     * The binding for the channel/listener.
     */
    channelBinding : WS_CHANNEL_BINDING

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">type of channel</a> being hosted by the endpoint.
     */
    channelType : WS_CHANNEL_TYPE

    /**
     * A description of the security required for this channel. This can be <b>NULL</b> if no security is required.
     */
    securityDescription : WS_SECURITY_DESCRIPTION.Ptr

    /**
     * The contract of the endpoint.
     */
    contract : WS_SERVICE_CONTRACT.Ptr

    /**
     * Authorization callback for the service endpoint.
     */
    authorizationCallback : IntPtr

    /**
     * An array of properties to configure the service endpoint.
     */
    properties : WS_SERVICE_ENDPOINT_PROPERTY.Ptr

    /**
     * Number of elements in the WS_SERVICE_ENDPOINT_PROPERTY array.
     */
    propertyCount : UInt32

    /**
     * Channel properties associated with the endpoint. An application should be careful in modifying default values. For example, modifying send/receive timeouts may result in unexpected behavior and cause the client to fail.
     */
    channelProperties : WS_CHANNEL_PROPERTIES

}
