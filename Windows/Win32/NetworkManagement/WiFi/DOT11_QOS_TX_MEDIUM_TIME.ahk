#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_QOS_TX_MEDIUM_TIME {
    #StructPack 4

    dot11PeerAddress : Int8[6]

    ucQoSPriority : Int8

    uMediumTimeAdmited : UInt32

}
