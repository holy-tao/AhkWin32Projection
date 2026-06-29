#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_DATA_BUFFER.ahk" { NFC_DATA_BUFFER }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_PAYLOAD {
    #StructPack 8

    hSocket : IntPtr

    bSAP : Int8

    sPayload : NFC_DATA_BUFFER

}
