#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PACKET_PROPERTY.ahk" { PACKET_PROPERTY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes the content of the packet for a particular tablet recognizer context.Do not use this structure to access the data contained in a packet. This structure describes the content of the packet.
 * @remarks
 * The <b>PACKET_DESCRIPTION</b> structure defines the logical layout of the packet. Typically, you do not need to address the contents of a packet. You pass the packets to the Ink object. However, if you need to address the contents of a packet, each packet contains a series of LONG values (properties) followed by one or more DWORD values (button states).
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-packet_description
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct PACKET_DESCRIPTION {
    #StructPack 8

    /**
     * The size, in bytes, of the packet data.
     */
    cbPacketSize : UInt32

    /**
     * The number of elements in the <i>pPacketProperties</i> array.
     */
    cPacketProperties : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-packet_property">PACKET_PROPERTY</a> structures.
     */
    pPacketProperties : PACKET_PROPERTY.Ptr

    /**
     * Deprecated. Do not use.
     */
    cButtons : UInt32

    /**
     * Deprecated. Do not use.
     */
    pguidButtons : Guid.Ptr

}
