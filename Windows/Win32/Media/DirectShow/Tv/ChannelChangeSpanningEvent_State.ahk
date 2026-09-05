#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class ChannelChangeSpanningEvent_State extends Win32Enum {

    /**
     * Native name: ChannelChangeSpanningEvent_Start
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: ChannelChangeSpanningEvent_End
     * @type {Integer (Int32)}
     */
    static End => 2
}
