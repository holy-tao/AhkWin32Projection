#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEB_SOCKET_PROPERTY_TYPE.ahk" { WEB_SOCKET_PROPERTY_TYPE }

/**
 * Contains a single WebSocket property.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ns-websocket-web_socket_property
 * @namespace Windows.Win32.Networking.WebSocket
 */
export default struct WEB_SOCKET_PROPERTY {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_property_type">WEB_SOCKET_PROPERTY_TYPE</a></b>
     * 
     * The WebSocket property type.
     */
    Type : WEB_SOCKET_PROPERTY_TYPE

    /**
     * Type: <b>PVOID</b>
     * 
     * A pointer to the value to set. The pointer must have an alignment compatible with the type of the property.
     */
    pvValue : IntPtr

    /**
     * Type: <b>ULONG</b>
     * 
     * The size, in bytes, of the property pointed to by <b>pvValue</b>.
     */
    ulValueSize : UInt32

}
