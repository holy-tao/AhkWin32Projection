#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_WAVEDATA {
    #StructPack 4

    cbSize : UInt32 := this.Size

    byData : Int8[4]

}
