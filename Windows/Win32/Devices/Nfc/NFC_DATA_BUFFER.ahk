#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_DATA_BUFFER {
    #StructPack 2

    cbBuffer : UInt16

    pbBuffer : Int8[1]

}
