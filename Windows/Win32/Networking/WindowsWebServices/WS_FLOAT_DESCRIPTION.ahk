#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An optional type description used with WS_FLOAT_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_float_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FLOAT_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum value.
     */
    minValue : Float32

    /**
     * The maximum value.
     */
    maxValue : Float32

}
