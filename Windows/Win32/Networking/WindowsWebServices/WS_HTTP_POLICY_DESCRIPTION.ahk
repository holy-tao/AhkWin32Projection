#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk

/**
 * Describes the policy specifying http channel binding.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Template description for the channel properties specified in policy.
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
