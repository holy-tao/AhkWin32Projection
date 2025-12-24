#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_HEADER_BITS_MIDL.ahk
#Include .\MPEG_HEADER_VERSION_BITS_MIDL.ahk

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
    static sizeof => 28

    static packingSize => 4

    class _Header_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {MPEG_HEADER_BITS_MIDL}
         */
        S{
            get {
                if(!this.HasProp("__S"))
                    this.__S := MPEG_HEADER_BITS_MIDL(0, this)
                return this.__S
            }
        }
    
        /**
         * @type {Integer}
         */
        W {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _Version_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * @type {MPEG_HEADER_VERSION_BITS_MIDL}
         */
        S{
            get {
                if(!this.HasProp("__S"))
                    this.__S := MPEG_HEADER_VERSION_BITS_MIDL(0, this)
                return this.__S
            }
        }
    
        /**
         * @type {Integer}
         */
        B {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    /**
     * Specifies the table identifier (TID) of the section.
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A union that contains the following members.
     * @type {_Header_e__Union}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := %this.__Class%._Header_e__Union(2, this)
            return this.__Header
        }
    }

    /**
     * Specifies the table_id_extension field.
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A union that contains the following members.
     * @type {_Version_e__Union}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := %this.__Class%._Version_e__Union(6, this)
            return this.__Version
        }
    }

    /**
     * Specifies the section_number field, which gives the section number for this section.
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Specifies the last_section_number field, which gives the last (highest) section number for the table.
     * @type {Integer}
     */
    LastSectionNumber {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Indicates that the message is an MPEG-2 DSM-CC message. The value of this field is always 0x11.
     * @type {Integer}
     */
    ProtocolDiscriminator {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies the DSM-CC message type.
     * @type {Integer}
     */
    DsmccType {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Specifies the DSM-CC message identifier.
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Specifies the transaction identifier.
     * @type {Integer}
     */
    TransactionId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved bytes.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Specifies the adaptation field length.
     * @type {Integer}
     */
    AdaptationLength {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Specifies the message length.
     * @type {Integer}
     */
    MessageLength {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * Contains the remaining section data, as a byte array. The length of the array is <c>Header.W.SectionLength - 17</c> bytes.
     * @type {Array<Byte>}
     */
    RemainingData{
        get {
            if(!this.HasProp("__RemainingDataProxyArray"))
                this.__RemainingDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__RemainingDataProxyArray
        }
    }
}
