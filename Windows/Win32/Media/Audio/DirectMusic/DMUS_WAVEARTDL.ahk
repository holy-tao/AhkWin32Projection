#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_WAVEARTDL {
    #StructPack 4

    ulDownloadIdIdx : UInt32

    ulBus : UInt32

    ulBuffers : UInt32

    ulMasterDLId : UInt32

    usOptions : UInt16

}
