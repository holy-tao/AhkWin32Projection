#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SERVICE_DISCOVER_SAP {
    #StructPack 4

    NumberOfEntries : UInt32

    SAPEntries : Int8[1]

}
