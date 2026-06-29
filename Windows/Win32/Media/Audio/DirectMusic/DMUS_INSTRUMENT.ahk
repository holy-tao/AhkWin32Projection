#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_INSTRUMENT {
    #StructPack 4

    ulPatch : UInt32

    ulFirstRegionIdx : UInt32

    ulGlobalArtIdx : UInt32

    ulFirstExtCkIdx : UInt32

    ulCopyrightIdx : UInt32

    ulFlags : UInt32

}
