#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a single WebSocket property.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ns-websocket-web_socket_property
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_property_type">WEB_SOCKET_PROPERTY_TYPE</a></b>
     * 
     * The WebSocket property type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * A pointer to the value to set. The pointer must have an alignment compatible with the type of the property.
     * @type {Pointer<Void>}
     */
    pvValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The size, in bytes, of the property pointed to by <b>pvValue</b>.
     * @type {Integer}
     */
    ulValueSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
