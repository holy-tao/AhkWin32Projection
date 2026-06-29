#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains one index entry for an AVI 2.0 standard index.
 * @remarks
 * For more information, see the <i>OpenDML AVI File Format Extensions</i>, published by the OpenDML AVI M-JPEG File Format Subcommittee. (This resource may not be available in some languages 
 * 
 * and countries.)
 * @see https://learn.microsoft.com/windows/win32/api/aviriff/ns-aviriff-avistdindex_entry
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVISTDINDEX_ENTRY {
    #StructPack 4

    /**
     * The offset, in bytes, to the start of the data. The offset is relative to the value of the <b>qwBaseOffset</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/aviriff/ns-aviriff-avistdindex">AVISTDINDEX</a>. The value is the offset of the actual audio/video data in the chunk, not the offset of the start of the chunk.
     */
    dwOffset : UInt32

    /**
     * The lower 31 bits contain the size of the data. The high bit is set to 1 if the frame is delta frame, or zero otherwise.
     */
    dwSize : UInt32

}
