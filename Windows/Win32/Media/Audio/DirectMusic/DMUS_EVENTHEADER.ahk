#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_EVENTHEADER {
    #StructPack 8

    cbEvent : UInt32

    dwChannelGroup : UInt32

    rtDelta : Int64

    dwFlags : UInt32

}
