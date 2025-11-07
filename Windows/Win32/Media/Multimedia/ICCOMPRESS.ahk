#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICCOMPRESS structure contains compression parameters used with the ICM_COMPRESS message.
 * @remarks
 * 
 * Drivers that perform temporal compression use data from the previous frame (found in the <b>lpbiPrev</b> and <b>lpPrev</b> members) to prune redundant data from the current frame.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-iccompress
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICCOMPRESS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output (compressed) format. The <b>biSizeImage</b> member must contain the size of the compressed data.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiOutput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the buffer where the driver should write the compressed data.
     * @type {Pointer<Void>}
     */
    lpOutput {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input (uncompressed) format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiInput {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the buffer containing input data.
     * @type {Pointer<Void>}
     */
    lpInput {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Address to contain the chunk identifier for data in the AVI file. If the value of this member is not <b>NULL</b>, the driver should specify a two-character code for the chunk identifier corresponding to the chunk identifier used in the AVI file.
     * @type {Pointer<Integer>}
     */
    lpckid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Address to contain flags for the AVI index. If the returned frame is a key frame, the driver should set the <b>AVIIF_KEYFRAME</b> flag.
     * @type {Pointer<Integer>}
     */
    lpdwFlags {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Number of the frame to compress.
     * @type {Integer}
     */
    lFrameNum {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Desired maximum size, in bytes, for compressing this frame. The size value is used for compression methods that can make tradeoffs between compressed image size and image quality. Specify zero for this member to use the default setting.
     * @type {Integer}
     */
    dwFrameSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Quality setting.
     * @type {Integer}
     */
    dwQuality {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the format of the previous frame, which is typically the same as the input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiPrev {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the buffer containing input data of the previous frame.
     * @type {Pointer<Void>}
     */
    lpPrev {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
