#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSMCC_FILTER_OPTIONS.ahk" { DSMCC_FILTER_OPTIONS }
#Import ".\ATSC_FILTER_OPTIONS.ahk" { ATSC_FILTER_OPTIONS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The MPEG2_FILTER structure specifies criteria for matching MPEG-2 section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG2_FILTER {
    #StructPack 4

    /**
     * Specifies the version number of the structure. This value must be 1 or higher.
     */
    bVersionNumber : Int8

    /**
     * Specifies the size of the structure data, excluding any padding bytes. Set this field equal to the constant <b>MPEG2_FILTER_VERSION_1_SIZE</b>.
     */
    wFilterSize : UInt16

    /**
     * If <b>TRUE</b>, the <b>Filter</b> and <b>Mask</b> members specify the filtering criteria as a pair of bit masks, and the remaining members of this structure are ignored. If this field is <b>FALSE</b>, the <b>Filter</b> and <b>Mask</b> members are ignored, and the other structure members contain the filtering criteria.
     */
    fUseRawFilteringBits : BOOL

    /**
     * Specifies a 16-byte bit mask, which contains the bit values to match in the section header.
     */
    Filter : Int8[16]

    /**
     * Specifies a 16-byte bit mask. Set any "don't care" bits equal to 1, and all other bits to 0. In other words, for each bit, if the value in <b>Mask</b> is 0, the corresponding bit in <b>Filter</b> will be matched against that bit in the section header. If the value in <b>Mask</b> is 1, that bit in the section header is ignored.
     */
    Mask : Int8[16]

    /**
     * If <b>TRUE</b>, the <b>table_ID_extension</b> field in the header must match the value of the <b>TableIdExtension</b> structure member. Otherwise, the <b>table_ID_extension</b> field is ignored.
     */
    fSpecifyTableIdExtension : BOOL

    /**
     * Specifies a value for the <b>table_ID_extension</b> field.
     */
    TableIdExtension : UInt16

    /**
     * If <b>TRUE</b>, the <b>version_number</b> field in the header must match the value of the <b>Version</b> structure member. Otherwise, the <b>version_number</b> field is ignored.
     */
    fSpecifyVersion : BOOL

    /**
     * Specifies a value for the <b>version_number</b> field.
     */
    Version : Int8

    /**
     * If <b>TRUE</b>, the <b>section_number</b> field in the header must match the value of the <b>SectionNumber</b> member. Otherwise, the <b>section_number</b> field is ignored.
     */
    fSpecifySectionNumber : BOOL

    /**
     * Specifies a value for the <b>section_number</b> field.
     */
    SectionNumber : Int8

    /**
     * If <b>TRUE</b>, the <b>current_next_indicator</b> bit in the header must match the value of the <b>fNext</b> structure member. Otherwise, the <b>current_next_indicator</b> field is ignored.
     */
    fSpecifyCurrentNext : BOOL

    /**
     * Specifies a value for the <b>current_next_indicator</b> bit. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_current_next_bit">MPEG_CURRENT_NEXT_BIT</a> enumeration type to specify this value.
     */
    fNext : BOOL

    /**
     * If <b>TRUE</b>, the <b>Dsmcc</b> member contains additional filtering criteria for the DSM-CC portions of the section header. Otherwise, the <b>Dsmcc</b> member is ignored.
     */
    fSpecifyDsmccOptions : BOOL

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_filter_options">DSMCC_FILTER_OPTIONS</a> structure that contains additional filtering criteria for the DSM-CC portions of the section header.
     */
    Dsmcc : DSMCC_FILTER_OPTIONS

    /**
     * If <b>TRUE</b>, the <b>Atsc</b> member contains additional filtering criteria. Otherwise, the <b>Atsc</b> member is ignored.
     */
    fSpecifyAtscOptions : BOOL

    /**
     * Specifies an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-atsc_filter_options">ATSC_FILTER_OPTIONS</a> structure that contains additional filtering criteria.
     */
    Atsc : ATSC_FILTER_OPTIONS

}
