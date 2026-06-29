#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_TUNER_TUNERSTATE {
    #StructPack 4

    lResult : Int32

    ulTuneLength : UInt32

    argbTuneData : Int8[1]

}
