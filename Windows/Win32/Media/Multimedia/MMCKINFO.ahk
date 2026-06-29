#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MMCKINFO structure contains information about a chunk in a RIFF file.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/ns-mmiscapi-mmckinfo
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MMCKINFO {
    #StructPack 4

    /**
     * Chunk identifier.
     */
    ckid : UInt32

    /**
     * Size, in bytes, of the data member of the chunk. The size of the data member does not include the 4-byte chunk identifier, the 4-byte chunk size, or the optional pad byte at the end of the data member.
     */
    cksize : UInt32

    /**
     * Form type for "RIFF" chunks or the list type for "LIST" chunks.
     */
    fccType : UInt32

    /**
     * File offset of the beginning of the chunk's data member, relative to the beginning of the file.
     */
    dwDataOffset : UInt32

    /**
     * Flags specifying additional information about the chunk. It can be zero or the following flag:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MMIO_DIRTY"></a><a id="mmio_dirty"></a><dl>
     * <dt><b>MMIO_DIRTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the chunk might have changed and should be updated by the <a href="https://docs.microsoft.com/previous-versions/dd757315(v=vs.85)">mmioAscend</a> function. This flag is set when a chunk is created by using the <a href="https://docs.microsoft.com/previous-versions/dd757317(v=vs.85)">mmioCreateChunk</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
