#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_RQST_PACKET structure defines a buffer to receive MPEG-2 section data.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_rqst_packet
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_RQST_PACKET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the length of the buffer that <b>pSection</b> points to. The minimum size for section data is 4096 bytes.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a buffer that receives the section data. The pointer is typed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure. The first bytes in the section contain header fields that are defined in the <b>SECTION</b> structure. The <b>SectionData</b> member of the <b>SECTION</b> structure is an array of bytes, containing the body of the section after the header bytes.
     * @type {Pointer<SECTION>}
     */
    pSection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
