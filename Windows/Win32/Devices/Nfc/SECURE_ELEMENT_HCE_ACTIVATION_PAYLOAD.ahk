#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_HCE_ACTIVATION_PAYLOAD {
    #StructPack 2

    bConnectionId : UInt16

    eRfTechType : Int8

    eRfProtocolType : Int8

}
