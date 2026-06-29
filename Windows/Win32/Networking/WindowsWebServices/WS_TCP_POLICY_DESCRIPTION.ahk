#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }

/**
 * Describes the policy specifying http channel binding. (WS_TCP_POLICY_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_POLICY_DESCRIPTION {
    #StructPack 8

    /**
     * Template description for the channel properties specified in policy.
     */
    channelProperties : WS_CHANNEL_PROPERTIES

}
