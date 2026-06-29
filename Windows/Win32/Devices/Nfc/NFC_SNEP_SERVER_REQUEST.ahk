#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_DATA_BUFFER.ahk" { NFC_DATA_BUFFER }
#Import ".\NFC_SNEP_REQUEST_TYPE.ahk" { NFC_SNEP_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SNEP_SERVER_REQUEST {
    #StructPack 8

    hSnepServer : IntPtr

    hConnection : IntPtr

    eRequestType : NFC_SNEP_REQUEST_TYPE

    sRequestPayload : NFC_DATA_BUFFER

}
