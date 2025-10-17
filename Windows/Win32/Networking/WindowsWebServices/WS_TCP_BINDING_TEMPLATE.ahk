#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk

/**
 * TCP template structure to be filled in by application for TCP binding.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_tcp_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TCP_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Application provided additional channel properties that cannot be represented in policy.
     * @type {WS_CHANNEL_PROPERTIES}
     */
    channelProperties{
        get {
            if(!this.HasProp("__channelProperties"))
                this.__channelProperties := WS_CHANNEL_PROPERTIES(0, this)
            return this.__channelProperties
        }
    }
}
