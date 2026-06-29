#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An optional type description used with WS_UNIQUE_ID_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_unique_id_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UNIQUE_ID_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum number of characters.  This only pertains 
     *                     to the case where the unique ID is represented as a string.
     */
    minCharCount : UInt32

    /**
     * The maximum number of characters.  This only pertains
     *                     to the case where the unique ID is represented as a string.
     */
    maxCharCount : UInt32

}
