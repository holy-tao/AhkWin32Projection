#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }

/**
 * TCP template structure to be filled in by application for TCP binding.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided additional channel properties that cannot be represented in policy.
     */
    channelProperties : WS_CHANNEL_PROPERTIES

}
