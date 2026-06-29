#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ATM_TD.ahk" { ATM_TD }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_TRAFFIC_DESCRIPTOR_IE {
    #StructPack 4

    Forward : ATM_TD

    Backward : ATM_TD

    BestEffort : BOOL

}
