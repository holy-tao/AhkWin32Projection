#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a packet of opaque data sent during an EAP authentication session.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodtypes/ns-eapmethodtypes-eappacket
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapPacket {
    #StructPack 1

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eapmethodtypes/ne-eapmethodtypes-eapcode">EapCode</a> enumeration value that identifies the packet type.
     */
    Code : Int8

    /**
     * The packet ID number.
     */
    Id : Int8

    /**
     * The length of the entire packet
     */
    Length : Int8[2]

    /**
     * The packet message data. This opaque data block continues after the first byte for <b>Length</b> - 1 bytes.
     */
    Data : Int8[1]

}
