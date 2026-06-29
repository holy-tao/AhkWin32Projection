#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SOCKET_OPTION.ahk" { NFC_LLCP_SOCKET_OPTION }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SNEP_SERVER_ACCEPT_INFO {
    #StructPack 8

    hSnepServer : IntPtr

    hConnection : IntPtr

    sSocketOption : NFC_LLCP_SOCKET_OPTION

}
