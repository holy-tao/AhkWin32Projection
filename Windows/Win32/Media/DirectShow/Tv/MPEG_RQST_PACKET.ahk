#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECTION.ahk" { SECTION }

/**
 * The MPEG_RQST_PACKET structure defines a buffer to receive MPEG-2 section data.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_rqst_packet
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_RQST_PACKET {
    #StructPack 8

    /**
     * Specifies the length of the buffer that <b>pSection</b> points to. The minimum size for section data is 4096 bytes.
     */
    dwLength : UInt32

    /**
     * Pointer to a buffer that receives the section data. The pointer is typed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure. The first bytes in the section contain header fields that are defined in the <b>SECTION</b> structure. The <b>SectionData</b> member of the <b>SECTION</b> structure is an array of bytes, containing the body of the section after the header bytes.
     */
    pSection : SECTION.Ptr

}
