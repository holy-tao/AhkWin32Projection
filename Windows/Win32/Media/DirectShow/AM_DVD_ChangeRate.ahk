#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVD_ChangeRate {
    #StructPack 8

    StartInTime : Int64

    StartOutTime : Int64

    Rate : Int32

}
