#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_STRING.ahk
#Include .\WS_ENDPOINT_ADDRESS.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk

/**
 * Represents an individual endpoint on a service host. The properties on the endpoint are used to specify the address, binding and contract.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_ENDPOINT extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The URL address on which the endpoint is going to listen.
     * @type {WS_ENDPOINT_ADDRESS}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := WS_ENDPOINT_ADDRESS(0, this)
            return this.__address
        }
    }

    /**
     * The binding for the channel/listener.
     * @type {Integer}
     */
    channelBinding {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">type of channel</a> being hosted by the endpoint.
     * @type {Integer}
     */
    channelType {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * A description of the security required for this channel. This can be <b>NULL</b> if no security is required.
     * @type {Pointer<WS_SECURITY_DESCRIPTION>}
     */
    securityDescription {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The contract of the endpoint.
     * @type {Pointer<WS_SERVICE_CONTRACT>}
     */
    contract {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Authorization callback for the service endpoint.
     * @type {Pointer<WS_SERVICE_SECURITY_CALLBACK>}
     */
    authorizationCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * An array of properties to configure the service endpoint.
     * @type {Pointer<WS_SERVICE_ENDPOINT_PROPERTY>}
     */
    properties {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Number of elements in the WS_SERVICE_ENDPOINT_PROPERTY array.
     * @type {Integer}
     */
    propertyCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Channel properties associated with the endpoint. An application should be careful in modifying default values. For example, modifying send/receive timeouts may result in unexpected behavior and cause the client to fail.
     * @type {WS_CHANNEL_PROPERTIES}
     */
    channelProperties{
        get {
            if(!this.HasProp("__channelProperties"))
                this.__channelProperties := WS_CHANNEL_PROPERTIES(88, this)
            return this.__channelProperties
        }
    }
}
