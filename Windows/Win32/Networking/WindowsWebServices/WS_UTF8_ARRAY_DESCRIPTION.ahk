#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This type description is used with WS_UTF8_ARRAY_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_utf8_array_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UTF8_ARRAY_DESCRIPTION {
    #StructPack 4

    /**
     * Specifies the minimum number of bytes of UTF8 character data.
     */
    minByteCount : UInt32

    /**
     * Specifies the maximum number of bytes of UTF8 character data.
     */
    maxByteCount : UInt32

}
