#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct LOOPEDSTREAMING_POSITION_EVENT_DATA {
    #StructPack 8

    KsEventData : KSEVENTDATA

    Position : Int64

}
