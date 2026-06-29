#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }

/**
 * An optional type description used with WS_DECIMAL_TYPE. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_decimal_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DECIMAL_DESCRIPTION {
    #StructPack 8

    /**
     * The minimum value.
     */
    minValue : DECIMAL

    /**
     * The maximum value.
     */
    maxValue : DECIMAL

}
