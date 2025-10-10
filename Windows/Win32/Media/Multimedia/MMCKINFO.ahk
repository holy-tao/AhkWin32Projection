#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMCKINFO structure contains information about a chunk in a RIFF file.
 * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/ns-mmiscapi-mmckinfo
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MMCKINFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Chunk identifier.
     * @type {Integer}
     */
    ckid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size, in bytes, of the data member of the chunk. The size of the data member does not include the 4-byte chunk identifier, the 4-byte chunk size, or the optional pad byte at the end of the data member.
     * @type {Integer}
     */
    cksize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Form type for "RIFF" chunks or the list type for "LIST" chunks.
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * File offset of the beginning of the chunk's data member, relative to the beginning of the file.
     * @type {Integer}
     */
    dwDataOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
