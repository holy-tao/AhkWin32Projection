#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_HCE_DATA_PACKET {
    #StructPack 2

    bConnectionId : UInt16

    cbPayload : UInt16

    pbPayload : Int8[1]

}
