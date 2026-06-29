#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct POOLTABLE {
    #StructPack 4

    cbSize : UInt32 := this.Size

    cCues : UInt32

}
