#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_QOS_TX_DURATION {
    #StructPack 4

    uNominalMSDUSize : UInt32

    uMinPHYRate : UInt32

    uDuration : UInt32

}
