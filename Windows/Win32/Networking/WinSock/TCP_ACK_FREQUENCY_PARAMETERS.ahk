#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_ACK_FREQUENCY_PARAMETERS {
    #StructPack 1

    TcpDelayedAckFrequency : Int8

}
