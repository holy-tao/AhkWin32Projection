#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_KEY_ALGO_TKIP_MIC {
    #StructPack 4

    ucIV48Counter : Int8[6]

    ulTKIPKeyLength : UInt32

    ulMICKeyLength : UInt32

    ucTKIPMICKeys : Int8[1]

}
