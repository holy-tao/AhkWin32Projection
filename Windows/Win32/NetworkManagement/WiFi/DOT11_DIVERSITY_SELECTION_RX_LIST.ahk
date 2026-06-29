#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_DIVERSITY_SELECTION_RX.ahk" { DOT11_DIVERSITY_SELECTION_RX }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DIVERSITY_SELECTION_RX_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11DiversitySelectionRx : DOT11_DIVERSITY_SELECTION_RX[1]

}
