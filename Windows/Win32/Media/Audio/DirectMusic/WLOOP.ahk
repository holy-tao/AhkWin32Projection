#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct WLOOP {
    #StructPack 4

    cbSize : UInt32 := this.Size

    ulType : UInt32

    ulStart : UInt32

    ulLength : UInt32

}
