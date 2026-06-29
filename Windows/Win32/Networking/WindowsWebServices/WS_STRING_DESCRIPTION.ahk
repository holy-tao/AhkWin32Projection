#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This type description is used with WS_STRING_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_STRING_DESCRIPTION {
    #StructPack 4

    /**
     * Specifies the minimum number of characters.
     */
    minCharCount : UInt32

    /**
     * Specifies the maximum number of characters.
     */
    maxCharCount : UInt32

}
