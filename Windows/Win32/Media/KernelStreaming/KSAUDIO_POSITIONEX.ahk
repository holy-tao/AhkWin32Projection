#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSAUDIO_POSITION.ahk" { KSAUDIO_POSITION }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_POSITIONEX {
    #StructPack 8

    TimerFrequency : Int64

    TimeStamp1 : Int64

    Position : KSAUDIO_POSITION

    TimeStamp2 : Int64

}
