#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DLSID {
    #StructPack 4

    ulData1 : UInt32

    usData2 : UInt16

    usData3 : UInt16

    abData4 : Int8[8]

}
