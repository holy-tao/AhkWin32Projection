#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_PROXY_PROPERTY_ID.ahk" { WS_PROXY_PROPERTY_ID }

/**
 * Specifies a proxy property. (WS_PROXY_PROPERTY)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_proxy_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PROXY_PROPERTY {
    #StructPack 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_proxy_property_id">WS_PROXY_PROPERTY_ID</a>.
     */
    id : WS_PROXY_PROPERTY_ID

    /**
     * The buffer for the property value.
     */
    value : IntPtr

    /**
     * The size of buffer, in bytes.
     */
    valueSize : UInt32

}
