#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The ICCOMPRESS structure contains compression parameters used with the ICM_COMPRESS message.
 * @remarks
 * Drivers that perform temporal compression use data from the previous frame (found in the <b>lpbiPrev</b> and <b>lpPrev</b> members) to prune redundant data from the current frame.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-iccompress
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICCOMPRESS {
    #StructPack 8

    /**
     * Flags used for compression. The following value is defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICCOMPRESS_KEYFRAME"></a><a id="iccompress_keyframe"></a><dl>
     * <dt><b>ICCOMPRESS_KEYFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input data should be treated as a key frame.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output (compressed) format. The <b>biSizeImage</b> member must contain the size of the compressed data.
     */
    lpbiOutput : BITMAPINFOHEADER.Ptr

    /**
     * Pointer to the buffer where the driver should write the compressed data.
     */
    lpOutput : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input (uncompressed) format.
     */
    lpbiInput : BITMAPINFOHEADER.Ptr

    /**
     * Pointer to the buffer containing input data.
     */
    lpInput : IntPtr

    /**
     * Address to contain the chunk identifier for data in the AVI file. If the value of this member is not <b>NULL</b>, the driver should specify a two-character code for the chunk identifier corresponding to the chunk identifier used in the AVI file.
     */
    lpckid : IntPtr

    /**
     * Address to contain flags for the AVI index. If the returned frame is a key frame, the driver should set the <b>AVIIF_KEYFRAME</b> flag.
     */
    lpdwFlags : IntPtr

    /**
     * Number of the frame to compress.
     */
    lFrameNum : Int32

    /**
     * Desired maximum size, in bytes, for compressing this frame. The size value is used for compression methods that can make tradeoffs between compressed image size and image quality. Specify zero for this member to use the default setting.
     */
    dwFrameSize : UInt32

    /**
     * Quality setting.
     */
    dwQuality : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the previous frame, which is typically the same as the input format.
     */
    lpbiPrev : BITMAPINFOHEADER.Ptr

    /**
     * Pointer to the buffer containing input data of the previous frame.
     */
    lpPrev : IntPtr

}
