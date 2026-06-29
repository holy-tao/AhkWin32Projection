#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ChannelType.ahk" { ChannelType }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ChannelTypeInfo {
    #StructPack 8

    channelType : ChannelType

    timeStamp : Int64

}
