#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the digital video (DV) encoding resolution.
 * @remarks
 * The meaning of the enumeration elements depends on whether the current format is NTSC or PAL:
 * 
 * <table>
 * <tr>
 * <th>Element</th>
 * <th>NTSC</th>
 * <th>PAL</th>
 * </tr>
 * <tr>
 * <td>DVENCODERRESOLUTION_720x480</td>
 * <td>720 x 480</td>
 * <td>720 x 576</td>
 * </tr>
 * <tr>
 * <td>DVENCODERRESOLUTION_360x240</td>
 * <td>360 x 240</td>
 * <td>360 x 288</td>
 * </tr>
 * <tr>
 * <td>DVENCODERRESOLUTION_180x120</td>
 * <td>180 x 120</td>
 * <td>180 x 144</td>
 * </tr>
 * <tr>
 * <td>DVENCODERRESOLUTION_88x60</td>
 * <td>88 x 60</td>
 * <td>88 x 72</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_dvencoderresolution
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _DVENCODERRESOLUTION extends Win32Enum{

    /**
     * See Remarks.
     * @type {Integer (Int32)}
     */
    static DVENCODERRESOLUTION_720x480 => 2012

    /**
     * See Remarks.
     * @type {Integer (Int32)}
     */
    static DVENCODERRESOLUTION_360x240 => 2013

    /**
     * See Remarks.
     * @type {Integer (Int32)}
     */
    static DVENCODERRESOLUTION_180x120 => 2014

    /**
     * See Remarks.
     * @type {Integer (Int32)}
     */
    static DVENCODERRESOLUTION_88x60 => 2015
}
