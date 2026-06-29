#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_ARTICULATION2 {
    #StructPack 4

    ulArtIdx : UInt32

    ulFirstExtCkIdx : UInt32

    ulNextArtIdx : UInt32

}
