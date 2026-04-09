#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class ChannelChangeSpanningEvent_State extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ChannelChangeSpanningEvent_Start => 0

    /**
     * @type {Integer (Int32)}
     */
    static ChannelChangeSpanningEvent_End => 2
}
