#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies constraints on the set of values which can be deserialized. (WS_CHAR_ARRAY_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_char_array_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHAR_ARRAY_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum number of characters.
     */
    minCharCount : UInt32

    /**
     * The maximum number of characters.
     */
    maxCharCount : UInt32

}
