#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_TUNER_DIAGNOSTICS {
    #StructPack 4

    lResult : Int32

    ulSignalLevel : UInt32

    ulSignalLevelQuality : UInt32

    ulSignalNoiseRatio : UInt32

}
