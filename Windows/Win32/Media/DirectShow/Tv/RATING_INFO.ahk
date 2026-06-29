#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RATING_SYSTEM.ahk" { RATING_SYSTEM }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct RATING_INFO {
    #StructPack 8

    rating_system_count : UInt32

    lpratingsystem : RATING_SYSTEM.Ptr

}
