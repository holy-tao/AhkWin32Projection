#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An optional type description used with WS_UINT8_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_uint8_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UINT8_DESCRIPTION {
    #StructPack 1

    /**
     * The minimum value.
     */
    minValue : Int8

    /**
     * The maximum value.
     */
    maxValue : Int8

}
