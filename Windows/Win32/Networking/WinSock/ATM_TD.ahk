#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_TD {
    #StructPack 4

    PeakCellRate_CLP0 : UInt32

    PeakCellRate_CLP01 : UInt32

    SustainableCellRate_CLP0 : UInt32

    SustainableCellRate_CLP01 : UInt32

    MaxBurstSize_CLP0 : UInt32

    MaxBurstSize_CLP01 : UInt32

    Tagging : BOOL

}
