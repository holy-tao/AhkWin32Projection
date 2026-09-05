#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 */
class _DVRESOLUTION extends Win32Enum {

    /**
     * Decode at full size.
     * Native name: DVRESOLUTION_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 1000

    /**
     * Decode at half size.
     * Native name: DVRESOLUTION_HALF
     * @type {Integer (Int32)}
     */
    static HALF => 1001

    /**
     * Decode at quarter size.
     * Native name: DVRESOLUTION_QUARTER
     * @type {Integer (Int32)}
     */
    static QUARTER => 1002

    /**
     * Decode at one-eighth size.
     * Native name: DVRESOLUTION_DC
     * @type {Integer (Int32)}
     */
    static DC => 1003
}
