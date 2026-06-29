#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct WSMPL {
    #StructPack 4

    cbSize : UInt32 := this.Size

    usUnityNote : UInt16

    sFineTune : Int16

    lAttenuation : Int32

    fulOptions : UInt32

    cSampleLoops : UInt32

}
