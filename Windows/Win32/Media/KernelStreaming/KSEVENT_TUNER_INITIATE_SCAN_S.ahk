#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_TUNER_INITIATE_SCAN_S {
    #StructPack 8

    EventData : KSEVENTDATA

    StartFrequency : UInt32

    EndFrequency : UInt32

}
