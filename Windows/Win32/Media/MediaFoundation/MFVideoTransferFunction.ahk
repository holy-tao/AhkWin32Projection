#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the conversion function from linear RGB to non-linear RGB (R'G'B').
 * @remarks
 * 
 * These flags are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-transfer-function-attribute">MF_MT_TRANSFER_FUNCTION</a> attribute.
 *       
 * 
 * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videotransferfunction">DXVA2_VideoTransferFunction</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mfvideotransferfunction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoTransferFunction{

    /**
     * Unknown. Treat as MFVideoTransFunc_709.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_Unknown => 0

    /**
     * Linear RGB (gamma = 1.0).
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_10 => 1

    /**
     * True 1.8 gamma, L' = L^1/1.8.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_18 => 2

    /**
     * True 2.0 gamma, L' = L^1/2.0.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_20 => 3

    /**
     * True 2.2 gamma, L' = L^1/2.2. This transfer function is used in ITU-R BT.470-2 System M (NTSC).
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_22 => 4

    /**
     * ITU-R BT.709 transfer function. Gamma 2.2 curve with a linear segment in the lower range. This transfer function is used in BT.709, BT.601, SMPTE 296M, SMPTE 170M, BT.470, and SPMTE 274M. In addition BT-1361 uses this function within the range [0...1].
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_709 => 5

    /**
     * SPMTE 240M transfer function. Gamma 2.2 curve with a linear segment in the lower range.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_240M => 6

    /**
     * sRGB transfer function. Gamma 2.4 curve with a linear segment in the lower range.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_sRGB => 7

    /**
     * True 2.8 gamma. L' = L^1/2.8. This transfer function is used in ITU-R BT.470-2 System B, G (PAL).
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_28 => 8

    /**
     * Logarithmic transfer (100:1 range); for example, as used in H.264 video.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_Log_100 => 9

    /**
     * Logarithmic transfer (316.22777:1 range); for example, as used in H.264 video.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_Log_316 => 10

    /**
     * Symmetric ITU-R BT.709.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_709_sym => 11

    /**
     * Constant luminance ITU-R BT.2020.  See <a href="https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf">Recommendation  ITU-R  BT.2020-2</a>.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_2020_const => 12

    /**
     * Non-constant luminance ITU-R BT.2020.  See <a href="https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf">Recommendation  ITU-R  BT.2020-2</a>.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_2020 => 13

    /**
     * True 2.6 gamma, L’=L^1/2.6
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_26 => 14

    /**
     * SMPTE ST.2084 also known as PQ.  Also defined in ITU-R BT.2100
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_2084 => 15

    /**
     * Hybrid Log-Gamma, ARIB STD-B67
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_HLG => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_10_rel => 17

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_BT1361_ECG => 18

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_SMPTE428 => 19

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_Last => 20

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoTransFunc_ForceDWORD => 2147483647
}
