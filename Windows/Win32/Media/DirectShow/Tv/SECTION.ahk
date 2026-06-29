#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_HEADER_BITS_MIDL.ahk" { MPEG_HEADER_BITS_MIDL }

/**
 * The SECTION structure represents a short header from an MPEG-2 table section.
 * @remarks
 * This structure represents an MPEG-2 short header. The section might contain a long header or DSM-CC header, each of which extends the short header:
 * 
 * <ul>
 * <li>If the <b>Header.W.SectionSyntaxIndicator</b> bit is set, the section uses the long syntax. In that case, you can cast a <b>SECTION</b> pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-long_section">LONG_SECTION</a> pointer.</li>
 * <li>If the TID indicates a DSM-CC user-to-network message (0x3B) or a download data message (0x3C), the section uses the DSM-CC header syntax. In that case, you can cast a <b>SECTION</b> pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_section">DSMCC_SECTION</a> pointer.</li>
 * </ul>
 * The following code shows how to access the bit fields within the <b>Header</b> member:
 * 
 * 
 * ```cpp
 * 
 * SECTION *pSection; // Points to the section data.
 * 
 * // Coerce the Header field to an MPEG_HEADER_BITS type.
 * MPEG_HEADER_BITS *pHeader = (MPEG_HEADER_BITS*)&pSection->Header.W;
 * 
 * // Now use the pHeader pointer to access the bit fields.
 * WORD SectionLength = pHeader->SectionLength;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SECTION {
    #StructPack 1


    struct _Header {
        S : MPEG_HEADER_BITS_MIDL

        static __New() {
            DefineProp(this.Prototype, 'W', { type: UInt16, offset: 0 })
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
    Header : SECTION._Header

    /**
     * Contains the section data, as a byte array. The length of the array is given by the <b>Header.W.SectionLength</b> field.
     */
    SectionData : Int8[1]

}
