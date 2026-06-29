#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to serialize and deserialize an array of bytes.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_bytes
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_BYTES {
    #StructPack 8

    length : UInt32

    bytes : IntPtr

}
