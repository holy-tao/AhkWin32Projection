#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_STREAM_INFO structure contains stream-control information.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-am_stream_info
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_STREAM_INFO {
    #StructPack 8

    /**
     * Time when the pin will start streaming data.
     */
    tStart : Int64

    /**
     * Time when the pin will stop streaming data.
     */
    tStop : Int64

    /**
     * Value that will be sent with the event notification when the pin starts.
     */
    dwStartCookie : UInt32

    /**
     * Value that will be sent with the event notification when the pin stops.
     */
    dwStopCookie : UInt32

    /**
     * Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-am_stream_info_flags">AM_STREAM_INFO_FLAGS</a> enumeration.
     */
    dwFlags : UInt32

}
