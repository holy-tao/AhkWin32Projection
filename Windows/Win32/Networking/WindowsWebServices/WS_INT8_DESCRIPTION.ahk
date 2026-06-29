#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * An optional type description used with WS_INT8_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_int8_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_INT8_DESCRIPTION {
    #StructPack 1

    /**
     * The minimum value.
     */
    minValue : CHAR

    /**
     * The maximum value.
     */
    maxValue : CHAR

}
