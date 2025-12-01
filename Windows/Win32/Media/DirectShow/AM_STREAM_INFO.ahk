#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_STREAM_INFO structure contains stream-control information.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-am_stream_info
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_STREAM_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Time when the pin will start streaming data.
     * @type {Integer}
     */
    tStart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Time when the pin will stop streaming data.
     * @type {Integer}
     */
    tStop {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Value that will be sent with the event notification when the pin starts.
     * @type {Integer}
     */
    dwStartCookie {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Value that will be sent with the event notification when the pin stops.
     * @type {Integer}
     */
    dwStopCookie {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-am_stream_info_flags">AM_STREAM_INFO_FLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
