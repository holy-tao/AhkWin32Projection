#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a default value for a field. This is used in a WS_FIELD_DESCRIPTION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_value
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DEFAULT_VALUE {
    #StructPack 8

    /**
     * A pointer to the default value.
     */
    value : IntPtr

    /**
     * The size of the default value, in bytes.
     */
    valueSize : UInt32

}
