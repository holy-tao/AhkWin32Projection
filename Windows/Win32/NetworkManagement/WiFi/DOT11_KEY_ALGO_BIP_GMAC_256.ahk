#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_KEY_ALGO_BIP_GMAC_256 {
    #StructPack 4

    ucIPN : Int8[6]

    ulBIPGmac256KeyLength : UInt32

    ucBIPGmac256Key : Int8[1]

}
