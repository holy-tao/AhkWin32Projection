#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An optional type description used with WS_INT32_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_int32_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_INT32_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum value.
     */
    minValue : Int32

    /**
     * The maximum value.
     */
    maxValue : Int32

}
