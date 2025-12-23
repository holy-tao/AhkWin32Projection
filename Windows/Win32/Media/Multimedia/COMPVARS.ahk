#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HIC.ahk

/**
 * The COMPVARS structure describes compressor settings for functions such as ICCompressorChoose, ICSeqCompressFrame, and ICCompressorFree.
 * @remarks
 * You can let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> fill the contents of this structure or you can do it manually. If you manually fill the structure, you must provide information for the following members: <b>cbSize</b>, <b>hic</b>, <b>lpbiOut</b>, <b>lKey</b>, and <b>lQ</b>. Also, you must set the <b>ICMF_COMPVARS_VALID</b> flag in the <b>dwFlags</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-compvars
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class COMPVARS extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Size, in bytes, of this structure. This member must be set to validate the structure before calling any function using this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Handle to the compressor to use. You can open a compressor and obtain a handle of it by using the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icopen">ICOpen</a> function. You can also choose a compressor by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>. <b>ICCompressorChoose</b> opens the chosen compressor and returns the handle of the compressor in this member. You can close the compressor by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorfree">ICCompressorFree</a>.
     * @type {HIC}
     */
    hic{
        get {
            if(!this.HasProp("__hic"))
                this.__hic := HIC(8, this)
            return this.__hic
        }
    }

    /**
     * Type of compressor used. Currently only <b>ICTYPE_VIDEO</b> (VIDC) is supported. This member can be set to zero.
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Four-character code of the compressor. Specify <b>NULL</b> to indicate the data is not to be recompressed. Specify "DIB" to indicate the data is an uncompressed, full frame. You can use this member to specify which compressor is selected by default when the dialog box is displayed.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<BITMAPINFO>}
     */
    lpbiIn {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure containing the image output format. You can specify a specific format to use or you can specify <b>NULL</b> to use the default compressor associated with the input format. You can also set the image output format by using <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a>.
     * @type {Pointer<BITMAPINFO>}
     */
    lpbiOut {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<Void>}
     */
    lpBitsOut {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<Void>}
     */
    lpBitsPrev {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    lFrame {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Key-frame rate. Specify an integer to indicate the frequency that key frames are to occur in the compressed sequence or zero to not use key frames. You can also let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> set the key-frame rate selected in the dialog box. The <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a> function uses the value of this member for making key frames.
     * @type {Integer}
     */
    lKey {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Data rate, in kilobytes per second. <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> copies the selected data rate from the dialog box to this member.
     * @type {Integer}
     */
    lDataRate {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Quality setting. Specify a quality setting of 1 to 10,000 or specify<b> ICQUALITY_DEFAULT</b> to use the default quality setting. You can also let <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-iccompressorchoose">ICCompressorChoose</a> set the quality value selected in the dialog box. <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icseqcompressframestart">ICSeqCompressFrameStart</a> uses the value of this member as its quality setting.
     * @type {Integer}
     */
    lQ {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    lKeyCount {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<Void>}
     */
    lpState {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    cbState {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 96
    }
}
