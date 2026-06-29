#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PEER_STATISTICS {
    #StructPack 8

    ullDecryptSuccessCount : Int64

    ullDecryptFailureCount : Int64

    ullTxPacketSuccessCount : Int64

    ullTxPacketFailureCount : Int64

    ullRxPacketSuccessCount : Int64

    ullRxPacketFailureCount : Int64

}
