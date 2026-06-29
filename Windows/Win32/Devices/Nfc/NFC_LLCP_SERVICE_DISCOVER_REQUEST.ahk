#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SERVICE_NAME_ENTRY.ahk" { NFC_LLCP_SERVICE_NAME_ENTRY }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SERVICE_DISCOVER_REQUEST {
    #StructPack 8

    hRemoteDev : IntPtr

    NumberOfEntries : UInt32

    ServiceNameEntries : NFC_LLCP_SERVICE_NAME_ENTRY[1]

}
