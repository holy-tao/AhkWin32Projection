#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SOCKET_ERROR.ahk" { NFC_LLCP_SOCKET_ERROR }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_ERROR_INFO {
    #StructPack 8

    hSocket : IntPtr

    eSocketError : NFC_LLCP_SOCKET_ERROR

}
