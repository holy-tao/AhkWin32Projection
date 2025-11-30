#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the conversion function from linear RGB to non-linear RGB (R'G'B').
 * @remarks
 * 
 * The following table shows the formulas for the most common transfer functions. In these formulas, L is the linear value and L' is the non-linear (gamma corrected) value. These values are relative to a normalized range [0...1].
 * 
 * <table>
 * <tr>
 * <th>Color space</th>
 * <th>Transfer function</th>
 * </tr>
 * <tr>
 * <td>sRGB (8-bit)</td>
 * <td>
 * L' = 12.92L, for L &lt; 0.031308
 * 
 * L' = 1.055L^1/2.4− 0.055, for L &gt;= 0.031308
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>BT.470-2 System B, G</td>
 * <td>L' = L^0.36</td>
 * </tr>
 * <tr>
 * <td>BT.470-2 System M</td>
 * <td>L' = L^0.45</td>
 * </tr>
 * <tr>
 * <td>BT.709</td>
 * <td>
 * L' = 4.50L, for L &lt; 0.018
 * 
 * L' = 1.099L^0.45− 0.099, for L &gt;= 0.018
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>scRGB</td>
 * <td>L' = L</td>
 * </tr>
 * <tr>
 * <td>SMPTE 240M</td>
 * <td>
 * L' = 4.0L, for L &lt; 0.0228
 * 
 * L' = 1.1115L^0.45− 0.01115, for L &gt;= 0.0228
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following table shows the inverse formulas to obtain the original gamma-corrected values:
 * 
 * <table>
 * <tr>
 * <th>Color space</th>
 * <th>Transfer function</th>
 * </tr>
 * <tr>
 * <td>sRGB (8-bit)</td>
 * <td>
 * L = 1/12.92L', for L' &lt; 0.03928
 * 
 * L = ((L' + 0.055)/1055)^2.4, for L' &gt;= 0.03928
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>BT.470-2 System B, G</td>
 * <td>L = L'^1/0.36</td>
 * </tr>
 * <tr>
 * <td>BT.470-2 System M</td>
 * <td>L = L'^1/0.45</td>
 * </tr>
 * <tr>
 * <td>BT.709</td>
 * <td>
 * L = L'/4.50, for L' &lt; 0.081
 * 
 * L = ((L' + 0.099) / 1.099)^1/0.45, for L' &gt;= 0.081
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>scRGB</td>
 * <td>L = L'</td>
 * </tr>
 * <tr>
 * <td>SMPTE 240M</td>
 * <td>
 * L = L'/4.0, for L' &lt; 0.0913
 * 
 * L= ((L' + 0.1115)/1.1115)^1/0.45, for L' &gt;= 0.0913
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * This enumeration is equivalent to the <b>DXVA_VideoTransferFunction</b> enumeration used in DXVA 1.0.
 * 
 * If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface to describe the video format, the transfer function is specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-transfer-function-attribute">MF_MT_TRANSFER_FUNCTION</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ne-dxva2api-dxva2_videotransferfunction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoTransferFunction extends Win32Enum{

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFuncMask => 31

    /**
     * Unknown. Treat as DXVA2_VideoTransFunc_709.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_Unknown => 0

    /**
     * Linear RGB (gamma = 1.0).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_10 => 1

    /**
     * True 1.8 gamma, L' = L^1/1.8.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_18 => 2

    /**
     * True 2.0 gamma, L' = L^1/2.0.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_20 => 3

    /**
     * True 2.2 gamma, L' = L^1/2.2. This transfer function is used in ITU-R BT.470-2 System M (NTSC).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_22 => 4

    /**
     * ITU-R BT.709 transfer function. Gamma 2.2 curve with a linear segment in the lower range. This transfer function is used in BT.709, BT.601, SMPTE 296M, SMPTE 170M, BT.470, and SMPTE 274M. In addition BT-1361 uses this function within the range [0...1].
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_709 => 5

    /**
     * SMPTE 240M transfer function. Gamma 2.2 curve with a linear segment in the lower range.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_240M => 6

    /**
     * sRGB transfer function. Gamma 2.4 curve with a linear segment in the lower range.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_sRGB => 7

    /**
     * True 2.8 gamma. L' = L^1/2.8. This transfer function is used in ITU-R BT.470-2 System B, G (PAL).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransFunc_28 => 8
}
