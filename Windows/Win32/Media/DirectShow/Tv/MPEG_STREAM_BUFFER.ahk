#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The MPEG_STREAM_BUFFER structure defines a buffer that receives MPEG-2 data.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-impeg2stream-supplydatabuffer">IMpeg2Stream::SupplyDataBuffer</a> method to get raw MPEG-2 data.
 * 
 * For PSI tables and sections, set <b>pDataBuffer</b> to point to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure. If you also create an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list">MPEG_PACKET_LIST</a> structure to hold a list of buffers, you can pass that list to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-isectionlist-initializewithrawsections">ISectionList::InitializeWithRawSections</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_stream_buffer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_STREAM_BUFFER {
    #StructPack 8

    /**
     * Specifies a status code. Use this value to check the status of the read request.
     */
    hr : HRESULT

    /**
     * Specifies the size of the buffer, in bytes.
     */
    dwDataBufferSize : UInt32

    /**
     * Specifies the amount of valid data in the buffer, in bytes
     */
    dwSizeOfDataRead : UInt32

    /**
     * Pointer to a buffer that holds the MPEG-2 data.
     */
    pDataBuffer : IntPtr

}
