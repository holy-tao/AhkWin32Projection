#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RECV_SENSITIVITY {
    #StructPack 4

    ucDataRate : Int8

    lRSSIMin : Int32

    lRSSIMax : Int32

}
