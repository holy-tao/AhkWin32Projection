#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_DATA_BUFFER.ahk" { NFC_DATA_BUFFER }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_REMOTE_DEV_RECV_INFO {
    #StructPack 8

    hRemoteDev : IntPtr

    sRecvBuffer : NFC_DATA_BUFFER

}
