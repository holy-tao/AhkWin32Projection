#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\WS_DURATION.ahk

/**
 * An optional type description used with WS_DURATION_TYPE. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_duration_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DURATION_DESCRIPTION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The minimum value.
     * @type {WS_DURATION}
     */
    minValue{
        get {
            if(!this.HasProp("__minValue"))
                this.__minValue := WS_DURATION(this.ptr + 0)
            return this.__minValue
        }
    }

    /**
     * The maximum value.
     * @type {WS_DURATION}
     */
    maxValue{
        get {
            if(!this.HasProp("__maxValue"))
                this.__maxValue := WS_DURATION(this.ptr + 40)
            return this.__maxValue
        }
    }

    /**
     * Specifies a function which can be used to compare <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a>. If <b>NULL</b>, a default
     *                     comparer is used.
     *                 
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a> has a partial ordering, not all durations can be unambiguously compared
     *                     (for example, 1 month and 30 days).  The default comparer function can compare durations that specify
     *                     years and months (but no other components), or durations that specify no years or months (but any other
     *                     component).
     * @type {Pointer<WS_DURATION_COMPARISON_CALLBACK>}
     */
    comparer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
