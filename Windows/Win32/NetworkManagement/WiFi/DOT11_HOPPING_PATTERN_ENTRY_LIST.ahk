#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_HOPPING_PATTERN_ENTRY.ahk" { DOT11_HOPPING_PATTERN_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_HOPPING_PATTERN_ENTRY_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11HoppingPatternEntry : DOT11_HOPPING_PATTERN_ENTRY[1]

}
