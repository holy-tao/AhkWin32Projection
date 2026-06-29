#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ChannelChangeSpanningEvent_State.ahk" { ChannelChangeSpanningEvent_State }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ChannelChangeInfo {
    #StructPack 8

    state : ChannelChangeSpanningEvent_State

    TimeStamp : Int64

}
