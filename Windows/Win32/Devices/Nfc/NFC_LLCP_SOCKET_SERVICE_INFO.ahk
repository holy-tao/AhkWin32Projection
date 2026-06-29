#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SERVICE_NAME_ENTRY.ahk" { NFC_LLCP_SERVICE_NAME_ENTRY }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_SERVICE_INFO {
    #StructPack 8

    hSocket : IntPtr

    bSAP : Int8

    sServiceName : NFC_LLCP_SERVICE_NAME_ENTRY

}
