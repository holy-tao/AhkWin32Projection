#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_DURATION.ahk" { WS_DURATION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An optional type description used with WS_DURATION_TYPE. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_duration_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DURATION_DESCRIPTION {
    #StructPack 8

    /**
     * The minimum value.
     */
    minValue : WS_DURATION

    /**
     * The maximum value.
     */
    maxValue : WS_DURATION

    /**
     * Specifies a function which can be used to compare <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a>. If <b>NULL</b>, a default
     *                     comparer is used.
     *                 
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a> has a partial ordering, not all durations can be unambiguously compared
     *                     (for example, 1 month and 30 days).  The default comparer function can compare durations that specify
     *                     years and months (but no other components), or durations that specify no years or months (but any other
     *                     component).
     */
    comparer : IntPtr

}
