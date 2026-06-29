#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CHANNEL_PROPERTY_ID.ahk" { WS_CHANNEL_PROPERTY_ID }

/**
 * Specifies a channel specific setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHANNEL_PROPERTY {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ID</a>.
     */
    id : WS_CHANNEL_PROPERTY_ID

    /**
     * A pointer to the value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     */
    value : IntPtr

    /**
     * The size in bytes of the memory pointed to by the <b>value</b> member.
     */
    valueSize : UInt32

}
