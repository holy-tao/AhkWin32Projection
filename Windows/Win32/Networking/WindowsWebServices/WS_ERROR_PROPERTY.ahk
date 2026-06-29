#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ERROR_PROPERTY_ID.ahk" { WS_ERROR_PROPERTY_ID }

/**
 * Specifies an error specific setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_error_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ERROR_PROPERTY {
    #StructPack 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ID</a>.
     */
    id : WS_ERROR_PROPERTY_ID

    /**
     * A pointer to the value to set.
     *                 The pointer must have an alignment compatible with the type
     *                 of the property.
     */
    value : IntPtr

    /**
     * The size, in bytes, of the memory pointed to by value.
     */
    valueSize : UInt32

}
