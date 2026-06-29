#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies information about a field which is neither serialized nor deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_void_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_VOID_DESCRIPTION {
    #StructPack 4

    /**
     * The size of the field.
     */
    size : UInt32

}
