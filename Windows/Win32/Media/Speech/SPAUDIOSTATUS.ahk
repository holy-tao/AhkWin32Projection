#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPAUDIOSTATE.ahk" { SPAUDIOSTATE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPAUDIOSTATUS {
    #StructPack 8

    cbFreeBuffSpace : Int32

    cbNonBlockingIO : UInt32

    State : SPAUDIOSTATE

    CurSeekPos : Int64

    CurDevicePos : Int64

    dwAudioLevel : UInt32

    dwReserved2 : UInt32

}
