#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_HEADER_VERSION_BITS_MIDL.ahk" { MPEG_HEADER_VERSION_BITS_MIDL }
#Import ".\MPEG_HEADER_BITS_MIDL.ahk" { MPEG_HEADER_BITS_MIDL }

/**
 * The DSMCC_SECTION structure represents a DSM-CC section header. If a section contains a DSM-CC header, you can cast a SECTION pointer to a DSMCC_SECTION pointer. For more information, see the Remarks section in the SECTION reference.
 * @remarks
 * This structure extends the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-long_section">LONG_SECTION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DSMCC_SECTION {
    #StructPack 4


    struct _Header {
        S : MPEG_HEADER_BITS_MIDL

        static __New() {
            DefineProp(this.Prototype, 'W', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Version {
        S : MPEG_HEADER_VERSION_BITS_MIDL

        static __New() {
            DefineProp(this.Prototype, 'B', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Specifies the table identifier (TID) of the section.
     */
    TableId : Int8

    /**
     * A union that contains the following members.
     */
    Header : DSMCC_SECTION._Header

    /**
     * Specifies the table_id_extension field.
     */
    TableIdExtension : UInt16

    /**
     * A union that contains the following members.
     */
    Version : DSMCC_SECTION._Version

    /**
     * Specifies the section_number field, which gives the section number for this section.
     */
    SectionNumber : Int8

    /**
     * Specifies the last_section_number field, which gives the last (highest) section number for the table.
     */
    LastSectionNumber : Int8

    /**
     * Indicates that the message is an MPEG-2 DSM-CC message. The value of this field is always 0x11.
     */
    ProtocolDiscriminator : Int8

    /**
     * Specifies the DSM-CC message type.
     */
    DsmccType : Int8

    /**
     * Specifies the DSM-CC message identifier.
     */
    MessageId : UInt16

    /**
     * Specifies the transaction identifier.
     */
    TransactionId : UInt32

    /**
     * Reserved bytes.
     */
    Reserved : Int8

    /**
     * Specifies the adaptation field length.
     */
    AdaptationLength : Int8

    /**
     * Specifies the message length.
     */
    MessageLength : UInt16

    /**
     * Contains the remaining section data, as a byte array. The length of the array is <c>Header.W.SectionLength - 17</c> bytes.
     */
    RemainingData : Int8[1]

}
