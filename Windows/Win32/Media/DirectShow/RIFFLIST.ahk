#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct RIFFLIST {
    #StructPack 4

    fcc : UInt32

    cb : UInt32

    fccListType : UInt32

}
