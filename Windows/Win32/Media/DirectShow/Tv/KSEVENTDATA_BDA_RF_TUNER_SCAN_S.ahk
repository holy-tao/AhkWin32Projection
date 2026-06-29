#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\BDA_LockType.ahk" { BDA_LockType }
#Import "..\..\KernelStreaming\KSEVENTDATA.ahk" { KSEVENTDATA }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSEVENTDATA_BDA_RF_TUNER_SCAN_S {
    #StructPack 8

    EventData : KSEVENTDATA

    StartFrequency : UInt32

    EndFrequency : UInt32

    LockRequested : BDA_LockType

}
