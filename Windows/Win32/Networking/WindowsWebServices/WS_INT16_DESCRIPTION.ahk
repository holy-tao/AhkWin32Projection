#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An optional type description used with WS_INT16_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_int16_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_INT16_DESCRIPTION {
    #StructPack 2

    /**
     * The minimum value.
     */
    minValue : Int16

    /**
     * The maximum value.
     */
    maxValue : Int16

}
