#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct CONNECTION {
    #StructPack 4

    usSource : UInt16

    usControl : UInt16

    usDestination : UInt16

    usTransform : UInt16

    lScale : Int32

}
