#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the color primaries of a video source. (DXVA2_VideoPrimaries)
 * @remarks
 * Color primaries define how to convert RGB colors into the CIE XYZ color space, and can be used to translate colors between different RGB color spaces. An RGB color space is defined by the chromaticity coordinates (x,y) of the RGB primaries plus the white point, as listed in the following table.
  * 
  * <table>
  * <tr>
  * <th>Color space</th>
  * <th>(Rx, Ry)</th>
  * <th>(Gx, Gy)</th>
  * <th>(Bx, By)</th>
  * <th>White point (Wx, Wy)</th>
  * </tr>
  * <tr>
  * <td>BT.709</td>
  * <td>(0.64, 0.33)</td>
  * <td>(0.30, 0.60)</td>
  * <td>(0.15, 0.06)</td>
  * <td>D65
  *               (0.3127, 0.3290)
  *             </td>
  * </tr>
  * <tr>
  * <td>BT.470-2 System B,G;
  *               EBU 3213
  *             </td>
  * <td>(0.64, 0.33)</td>
  * <td>(0.29, 0.60)</td>
  * <td>(0.15, 0.06)</td>
  * <td>D65
  *               (0.3127, 0.3290)
  *             </td>
  * </tr>
  * <tr>
  * <td>BT.470-4 System M</td>
  * <td>(0.67, 0.33)</td>
  * <td>(0.21, 0.71)</td>
  * <td>(0.14, 0.08)</td>
  * <td>CIE III.C
  *               (0.310, 0.316)
  *             </td>
  * </tr>
  * <tr>
  * <td>SMPTE 170M; SMPTE 240M;
  *               SMPTE C
  *             </td>
  * <td>(0.63, 0.34)</td>
  * <td>(0.31, 0.595)</td>
  * <td>(0.155, 0.07)</td>
  * <td>D65
  *               (0.3127, 0.3291)
  *             </td>
  * </tr>
  * </table>
  *  
  * 
  * The z coordinates can be derived from x and y as follows: z = 1 - x - y. To convert between RGB colors to CIE XYZ tristimulus values, compute a matrix <i>T</i> as follows:
  * 
  * <img alt="Screenshot of a matrix computation, showing an RGB conversion." border="" src="images/6b28e3fc-d85b-4cd2-a535-522ac9f11501.gif"/>
  * Given <i>T</i>, you can use the following formulas to convert between an RGB color value and a CIE XYZ tristimulus value. These formulas assume that the RGB components are linear (not gamma corrected) and are normalized to the range [0...1].
  * 
  * <img alt="Screenshot of a matrix computation, showing a conversion between an RGB color value and a CIE XYZ tristimulus value." border="" src="images/5e0b7470-4123-49f4-93ed-be9955ccf825.gif"/>
  * To convert colors directly from one RGB color space to another, use the following formula, where <i>T1</i> is the matrix for color space RGB1, and <i>T2</i> is the matrix for color space RGB2.
  * 
  * <img alt="Screenshot of a matrix computation, showing a conversion of one RGB color space to another." border="" src="images/3c2f9626-ef5e-4165-a24e-8720e215ef13.gif"/>
  * For a derivation of these formulas, refer to Charles Poynton, Digital Video and HDTV Algorithms and Interfaces (Morgan Kaufmann, 2003).
  * 
  * This enumeration is equivalent to the <b>DXVA_VideoPrimaries</b> enumeration used in DXVA 1.0.
  *       
  * 
  * If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface to describe the video format, the color primaries are specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-primaries-attribute">MF_MT_VIDEO_PRIMARIES</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_videoprimaries
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoPrimaries{

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimariesMask => 31

    /**
     * Unknown. Treat as <b>DXVA2_VideoPrimaries_BT709</b>.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_Unknown => 0

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_reserved => 1

    /**
     * ITU-R BT.709. Also used for sRGB and scRGB.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_BT709 => 2

    /**
     * ITU-R BT.470-4 System M (NTSC).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_BT470_2_SysM => 3

    /**
     * ITU-R BT.470-4 System B,G (PAL).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_BT470_2_SysBG => 4

    /**
     * SMPTE 170M.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_SMPTE170M => 5

    /**
     * SMPTE 240M.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_SMPTE240M => 6

    /**
     * EBU Tech. 3213.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_EBU3213 => 7

    /**
     * SMPTE C (SMPTE RP 145).
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoPrimaries_SMPTE_C => 8
}
