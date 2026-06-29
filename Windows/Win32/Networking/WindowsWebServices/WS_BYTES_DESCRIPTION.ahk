#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies constraints on the set of values which can be deserialized. (WS_BYTES_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_bytes_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_BYTES_DESCRIPTION {
    #StructPack 4

    /**
     * Specifies the minimum number of bytes.
     */
    minByteCount : UInt32

    /**
     * Specifies the maximum number of bytes.
     */
    maxByteCount : UInt32

}
