#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OI {
    #StructPack 2

    OILength : UInt16

    OI : Int8[5]

}
