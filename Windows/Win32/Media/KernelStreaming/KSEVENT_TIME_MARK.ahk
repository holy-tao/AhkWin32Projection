#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_TIME_MARK {
    #StructPack 8

    EventData : KSEVENTDATA

    MarkTime : Int64

}
