#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VIDEOHDR structure is used by the capVideoStreamCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-videohdr
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct VIDEOHDR {
    #StructPack 8

    /**
     * Pointer to locked data buffer.
     */
    lpData : IntPtr

    /**
     * Length of data buffer.
     */
    dwBufferLength : UInt32

    /**
     * Bytes actually used.
     */
    dwBytesUsed : UInt32

    /**
     * Milliseconds from start of stream.
     */
    dwTimeCaptured : UInt32

    /**
     * User-defined data.
     */
    dwUser : IntPtr

    /**
     * The flags are defined as follows.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>VHDR_DONE</td>
     * <td>Done bit</td>
     * </tr>
     * <tr>
     * <td>VHDR_PREPARED</td>
     * <td>Set if this header has been prepared</td>
     * </tr>
     * <tr>
     * <td>VHDR_INQUEUE</td>
     * <td>Reserved for driver</td>
     * </tr>
     * <tr>
     * <td>VHDR_KEYFRAME</td>
     * <td>Key Frame</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Reserved for driver.
     */
    dwReserved : IntPtr[4]

}
