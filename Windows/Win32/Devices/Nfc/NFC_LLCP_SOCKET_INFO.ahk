#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SOCKET_TYPE.ahk" { NFC_LLCP_SOCKET_TYPE }
#Import ".\NFC_LLCP_SOCKET_OPTION.ahk" { NFC_LLCP_SOCKET_OPTION }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_INFO {
    #StructPack 4

    eSocketType : NFC_LLCP_SOCKET_TYPE

    sSocketOption : NFC_LLCP_SOCKET_OPTION

}
