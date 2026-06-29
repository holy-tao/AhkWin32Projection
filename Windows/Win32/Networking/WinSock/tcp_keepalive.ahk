#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct tcp_keepalive {
    #StructPack 4

    onoff : UInt32

    keepalivetime : UInt32

    keepaliveinterval : UInt32

}
