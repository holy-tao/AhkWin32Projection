#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RATE_SET {
    #StructPack 4

    uRateSetLength : UInt32

    ucRateSet : Int8[126]

}
