#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_EXTENSIONCHUNK {
    #StructPack 4

    cbSize : UInt32 := this.Size

    ulNextExtCkIdx : UInt32

    ExtCkID : UInt32

    byExtCk : Int8[4]

}
