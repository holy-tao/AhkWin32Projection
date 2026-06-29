#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_COPYRIGHT {
    #StructPack 4

    cbSize : UInt32 := this.Size

    byCopyright : Int8[4]

}
