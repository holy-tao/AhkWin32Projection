#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_USERACTIVITY_INTERVAL {
    #StructPack 4

    lResult : Int32

    ulActivityInterval : UInt32

}
