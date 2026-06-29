#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CALL_PROPERTY_ID.ahk" { WS_CALL_PROPERTY_ID }

/**
 * Specifies a proxy property. (WS_CALL_PROPERTY)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_call_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CALL_PROPERTY {
    #StructPack 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_call_property_id">WS_CALL_PROPERTY_ID</a>.
     */
    id : WS_CALL_PROPERTY_ID

    /**
     * Pointer to a buffer for the value of the property.
     *                 The pointer must have an alignment compatible with the type
     *                 of the property.
     */
    value : IntPtr

    /**
     * The size of buffer in bytes.
     */
    valueSize : UInt32

}
