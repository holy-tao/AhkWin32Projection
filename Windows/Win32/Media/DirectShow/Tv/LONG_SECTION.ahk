#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_HEADER_VERSION_BITS_MIDL.ahk" { MPEG_HEADER_VERSION_BITS_MIDL }
#Import ".\MPEG_HEADER_BITS_MIDL.ahk" { MPEG_HEADER_BITS_MIDL }

/**
 * The LONG_SECTION structure represents a long MPEG-2 section header. If a section contains a long header, you can cast a SECTION pointer to a LONG_SECTION pointer. For more information, see the Remarks section in the SECTION reference.
 * @remarks
 * The following code shows how to access the bit fields within the <b>Version</b> member:
 * 
 * 
 * ```cpp
 * 
 * LONG_SECTION *pSection; // Points to the section data.
 * 
 * // Coerce the Version field to an MPEG_HEADER_VERSION_BITS type.
 * MPEG_HEADER_VERSION_BITS *pVersion;
 * pVersion = (MPEG_HEADER_VERSION_BITS*)&pSection->Version.B;
 * 
 * // Now use the pHeader pointer to access the bit fields.
 * BYTE VersionNumber = pSection->VersionNumber;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-long_section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct LONG_SECTION {
    #StructPack 2


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
    Header : LONG_SECTION._Header

    /**
     * Specifies the table_id_extension field.
     */
    TableIdExtension : UInt16

    /**
     * A union that contains the following members.
     */
    Version : LONG_SECTION._Version

    /**
     * Specifies the section_number field, which gives the section number for this section.
     */
    SectionNumber : Int8

    /**
     * Specifies the last_section_number field, which gives the last (highest) section number for the table.
     */
    LastSectionNumber : Int8

    /**
     * Contains the remaining section data, as a byte array. The length of the array is <c>Header.W.SectionLength - 5</c> bytes.
     */
    RemainingData : Int8[1]

}
