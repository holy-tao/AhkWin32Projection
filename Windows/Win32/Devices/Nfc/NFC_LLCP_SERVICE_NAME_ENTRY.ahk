#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SERVICE_NAME_ENTRY {
    #StructPack 4

    cbServiceName : UInt32

    pbServiceName : Int8[1]

}
