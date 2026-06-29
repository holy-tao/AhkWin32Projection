#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_SNEP_SERVER_TYPE.ahk" { NFC_SNEP_SERVER_TYPE }
#Import ".\NFC_LLCP_SERVICE_NAME_ENTRY.ahk" { NFC_LLCP_SERVICE_NAME_ENTRY }
#Import ".\NFC_LLCP_SOCKET_OPTION.ahk" { NFC_LLCP_SOCKET_OPTION }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SNEP_CLIENT_INFO {
    #StructPack 8

    hRemoteDev : IntPtr

    eServerType : NFC_SNEP_SERVER_TYPE

    sSocketOption : NFC_LLCP_SOCKET_OPTION

    sService : NFC_LLCP_SERVICE_NAME_ENTRY

}
