#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the content of the packet for a particular tablet recognizer context.Do not use this structure to access the data contained in a packet. This structure describes the content of the packet.
 * @remarks
 * 
  * The <b>PACKET_DESCRIPTION</b> structure defines the logical layout of the packet. Typically, you do not need to address the contents of a packet. You pass the packets to the Ink object. However, if you need to address the contents of a packet, each packet contains a series of LONG values (properties) followed by one or more DWORD values (button states).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tpcshrd/ns-tpcshrd-packet_description
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PACKET_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the packet data.
     * @type {Integer}
     */
    cbPacketSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of elements in the <i>pPacketProperties</i> array.
     * @type {Integer}
     */
    cPacketProperties {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-packet_property">PACKET_PROPERTY</a> structures.
     * @type {Pointer<PACKET_PROPERTY>}
     */
    pPacketProperties {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Deprecated. Do not use.
     * @type {Integer}
     */
    cButtons {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Deprecated. Do not use.
     * @type {Pointer<Guid>}
     */
    pguidButtons {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
