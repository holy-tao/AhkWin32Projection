#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the digital video (DV) decoding resolution.
 * @remarks
 * The decoding resolution depends on whether the current format is NTSC or PAL:
  * 
  * <table>
  * <tr>
  * <th>Enumeration</th>
  * <th>NTSC</th>
  * <th>PAL</th>
  * </tr>
  * <tr>
  * <td>DVRESOLUTION_FULL</td>
  * <td>720 x 480</td>
  * <td>720 x 576</td>
  * </tr>
  * <tr>
  * <td>DVRESOLUTION_HALF</td>
  * <td>360 x 240</td>
  * <td>360 x 288</td>
  * </tr>
  * <tr>
  * <td>DVRESOLUTION_QUARTER</td>
  * <td>180 x 120</td>
  * <td>180 x 144</td>
  * </tr>
  * <tr>
  * <td>DVRESOLUTION_DC</td>
  * <td>88 x 60</td>
  * <td>88 x 72</td>
  * </tr>
  * </table>
  *  
  * 
  * The following enumeration defined in strmif.h is equivalent to the <b>_DVRESOLUTION</b> enumeration. It is included for compatibility with existing applications.
  * 
  * 
  * ``` syntax
  * enum _DVDECODERRESOLUTION {
  *     DVDECODERRESOLUTION_720x480     =   1000,
  *     DVDECODERRESOLUTION_360x240     =   1001,
  *     DVDECODERRESOLUTION_180x120     =   1002,
  *     DVDECODERRESOLUTION_88x60       =   1003
  * };
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_dvresolution
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _DVRESOLUTION{

    /**
     * Decode at full size.
     * @type {Integer (Int32)}
     */
    static DVRESOLUTION_FULL => 1000

    /**
     * Decode at half size.
     * @type {Integer (Int32)}
     */
    static DVRESOLUTION_HALF => 1001

    /**
     * Decode at quarter size.
     * @type {Integer (Int32)}
     */
    static DVRESOLUTION_QUARTER => 1002

    /**
     * Decode at one-eighth size.
     * @type {Integer (Int32)}
     */
    static DVRESOLUTION_DC => 1003
}
