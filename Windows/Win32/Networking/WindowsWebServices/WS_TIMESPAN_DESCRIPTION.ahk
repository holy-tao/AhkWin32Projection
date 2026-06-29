#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_TIMESPAN.ahk" { WS_TIMESPAN }

/**
 * This type description is used with WS_TIMESPAN_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_timespan_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TIMESPAN_DESCRIPTION {
    #StructPack 8

    /**
     * The minimum value.
     */
    minValue : WS_TIMESPAN

    /**
     * The maximum value.
     */
    maxValue : WS_TIMESPAN

}
