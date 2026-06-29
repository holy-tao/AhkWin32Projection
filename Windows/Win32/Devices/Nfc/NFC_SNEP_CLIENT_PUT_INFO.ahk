#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_DATA_BUFFER.ahk" { NFC_DATA_BUFFER }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SNEP_CLIENT_PUT_INFO {
    #StructPack 8

    hSnepClient : IntPtr

    sPutPayload : NFC_DATA_BUFFER

}
