#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_KEY_ALGO_GCMP_256 {
    #StructPack 4

    ucIV48Counter : Int8[6]

    ulGCMP256KeyLength : UInt32

    ucGCMP256Key : Int8[1]

}
