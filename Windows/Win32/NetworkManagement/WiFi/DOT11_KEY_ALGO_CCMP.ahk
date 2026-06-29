#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_KEY_ALGO_CCMP {
    #StructPack 4

    ucIV48Counter : Int8[6]

    ulCCMPKeyLength : UInt32

    ucCCMPKey : Int8[1]

}
