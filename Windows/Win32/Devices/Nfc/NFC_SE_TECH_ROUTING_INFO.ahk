#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_TECH_ROUTING_INFO {
    #StructPack 8

    hSecureElement : IntPtr

    bPowerState : Int8

    eRfTechType : Int8

}
