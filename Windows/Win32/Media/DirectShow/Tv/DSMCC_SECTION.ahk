#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The DSMCC_SECTION structure represents a DSM-CC section header. If a section contains a DSM-CC header, you can cast a SECTION pointer to a DSMCC_SECTION pointer. For more information, see the Remarks section in the SECTION reference.
 * @remarks
 * This structure extends the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-long_section">LONG_SECTION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DSMCC_SECTION extends Win32Struct
{
    static sizeof => 21

    static packingSize => 1

    /**
     * Specifies the table identifier (TID) of the section.
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    S {
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    W {
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * Specifies the table_id_extension field.
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 3, "ushort")
        set => NumPut("ushort", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    B {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Specifies the section_number field, which gives the section number for this section.
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Specifies the last_section_number field, which gives the last (highest) section number for the table.
     * @type {Integer}
     */
    LastSectionNumber {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Indicates that the message is an MPEG-2 DSM-CC message. The value of this field is always 0x11.
     * @type {Integer}
     */
    ProtocolDiscriminator {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies the DSM-CC message type.
     * @type {Integer}
     */
    DsmccType {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies the DSM-CC message identifier.
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Specifies the transaction identifier.
     * @type {Integer}
     */
    TransactionId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved bytes.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Specifies the adaptation field length.
     * @type {Integer}
     */
    AdaptationLength {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Specifies the message length.
     * @type {Integer}
     */
    MessageLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Contains the remaining section data, as a byte array. The length of the array is <c>Header.W.SectionLength - 17</c> bytes.
     * @type {Array<Byte>}
     */
    RemainingData{
        get {
            if(!this.HasProp("__RemainingDataProxyArray"))
                this.__RemainingDataProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__RemainingDataProxyArray
        }
    }
}
