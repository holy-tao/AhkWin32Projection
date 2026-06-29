#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_DOWNLOADINFO {
    #StructPack 4

    dwDLType : UInt32

    dwDLId : UInt32

    dwNumOffsetTableEntries : UInt32

    cbSize : UInt32 := this.Size

}
