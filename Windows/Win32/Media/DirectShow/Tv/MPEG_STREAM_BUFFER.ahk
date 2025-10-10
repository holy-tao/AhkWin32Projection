#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_STREAM_BUFFER structure defines a buffer that receives MPEG-2 data.
 * @remarks
 * 
  * This structure is used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-impeg2stream-supplydatabuffer">IMpeg2Stream::SupplyDataBuffer</a> method to get raw MPEG-2 data.
  * 
  * For PSI tables and sections, set <b>pDataBuffer</b> to point to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure. If you also create an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list">MPEG_PACKET_LIST</a> structure to hold a list of buffers, you can pass that list to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-isectionlist-initializewithrawsections">ISectionList::InitializeWithRawSections</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpeg_stream_buffer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_STREAM_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies a status code. Use this value to check the status of the read request.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the size of the buffer, in bytes.
     * @type {Integer}
     */
    dwDataBufferSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the amount of valid data in the buffer, in bytes
     * @type {Integer}
     */
    dwSizeOfDataRead {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a buffer that holds the MPEG-2 data.
     * @type {Pointer<Byte>}
     */
    pDataBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
