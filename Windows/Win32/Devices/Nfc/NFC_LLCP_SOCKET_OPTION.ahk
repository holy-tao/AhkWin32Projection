#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_OPTION {
    #StructPack 2

    uMIUX : UInt16

    bRW : Int8

}
