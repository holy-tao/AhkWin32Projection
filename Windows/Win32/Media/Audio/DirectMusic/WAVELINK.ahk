#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct WAVELINK {
    #StructPack 4

    fusOptions : UInt16

    usPhaseGroup : UInt16

    ulChannel : UInt32

    ulTableIndex : UInt32

}
