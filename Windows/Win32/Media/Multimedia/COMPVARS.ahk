#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIC.ahk" { HIC }
#Import "..\..\Graphics\Gdi\BITMAPINFO.ahk" { BITMAPINFO }

/**
 * The COMPVARS structure describes compressor settings for functions such as ICCompressorChoose, ICSeqCompressFrame, and ICCompressorFree.
 * @remarks
 * You can let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> fill the contents of this structure or you can do it manually. If you manually fill the structure, you must provide information for the following members: <b>cbSize</b>, <b>hic</b>, <b>lpbiOut</b>, <b>lKey</b>, and <b>lQ</b>. Also, you must set the <b>ICMF_COMPVARS_VALID</b> flag in the <b>dwFlags</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-compvars
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct COMPVARS {
    #StructPack 8

    /**
     * Size, in bytes, of this structure. This member must be set to validate the structure before calling any function using this structure.
     */
    cbSize : Int32 := this.Size

    /**
     * Applicable flags. The following value is defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMF_COMPVARS_VALID"></a><a id="icmf_compvars_valid"></a><dl>
     * <dt><b>ICMF_COMPVARS_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data in this structure is valid and has been manually entered. Set this flag before you call any function if you fill this structure manually. Do not set this flag if you let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> initialize this structure.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Handle to the compressor to use. You can open a compressor and obtain a handle of it by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. You can also choose a compressor by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>. <b>ICCompressorChoose</b> opens the chosen compressor and returns the handle of the compressor in this member. You can close the compressor by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorfree">ICCompressorFree</a>.
     */
    hic : HIC

    /**
     * Type of compressor used. Currently only <b>ICTYPE_VIDEO</b> (VIDC) is supported. This member can be set to zero.
     */
    fccType : UInt32

    /**
     * Four-character code of the compressor. Specify <b>NULL</b> to indicate the data is not to be recompressed. Specify "DIB" to indicate the data is an uncompressed, full frame. You can use this member to specify which compressor is selected by default when the dialog box is displayed.
     */
    fccHandler : UInt32

    /**
     * Reserved; do not use.
     */
    lpbiIn : BITMAPINFO.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the image output format. You can specify a specific format to use or you can specify <b>NULL</b> to use the default compressor associated with the input format. You can also set the image output format by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.
     */
    lpbiOut : BITMAPINFO.Ptr

    /**
     * Reserved; do not use.
     */
    lpBitsOut : IntPtr

    /**
     * Reserved; do not use.
     */
    lpBitsPrev : IntPtr

    /**
     * Reserved; do not use.
     */
    lFrame : Int32

    /**
     * Key-frame rate. Specify an integer to indicate the frequency that key frames are to occur in the compressed sequence or zero to not use key frames. You can also let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> set the key-frame rate selected in the dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a> function uses the value of this member for making key frames.
     */
    lKey : Int32

    /**
     * Data rate, in kilobytes per second. <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> copies the selected data rate from the dialog box to this member.
     */
    lDataRate : Int32

    /**
     * Quality setting. Specify a quality setting of 1 to 10,000 or specify<b> ICQUALITY_DEFAULT</b> to use the default quality setting. You can also let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> set the quality value selected in the dialog box. <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a> uses the value of this member as its quality setting.
     */
    lQ : Int32

    /**
     * Reserved; do not use.
     */
    lKeyCount : Int32

    /**
     * Reserved; do not use.
     */
    lpState : IntPtr

    /**
     * Reserved; do not use.
     */
    cbState : Int32

}
