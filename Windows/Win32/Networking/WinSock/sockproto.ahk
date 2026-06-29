#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct sockproto {
    #StructPack 2

    sp_family : UInt16

    sp_protocol : UInt16

}
