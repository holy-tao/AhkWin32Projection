#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_HOPPING_PATTERN_ENTRY {
    #StructPack 4

    uHoppingPatternIndex : UInt32

    uRandomTableFieldNumber : UInt32

}
