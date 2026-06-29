#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_AID_ROUTING_INFO {
    #StructPack 8

    hSecureElement : IntPtr

    bPowerState : Int8

    cbAid : UInt32

    pbAid : Int8[16]

}
