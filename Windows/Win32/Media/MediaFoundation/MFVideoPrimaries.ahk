#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the color primaries of a video source.
 * @remarks
 * 
  * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-primaries-attribute">MF_MT_VIDEO_PRIMARIES</a> attribute.
  * 
  * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videoprimaries">DXVA2_VideoPrimaries</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mfvideoprimaries
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoPrimaries{

    /**
     * The color primaries are unknown.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_Unknown => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_reserved => 1

    /**
     * ITU-R BT.709. Also used for sRGB and scRGB.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_BT709 => 2

    /**
     * ITU-R BT.470-4 System M (NTSC).
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_BT470_2_SysM => 3

    /**
     * ITU-R BT.470-4 System B,G (NTSC).
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_BT470_2_SysBG => 4

    /**
     * SMPTE 170M.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_SMPTE170M => 5

    /**
     * SMPTE 240M.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_SMPTE240M => 6

    /**
     * EBU 3213.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_EBU3213 => 7

    /**
     * SMPTE C (SMPTE RP 145).
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_SMPTE_C => 8

    /**
     * ITU-R BT.2020 color primaries.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_BT2020 => 9

    /**
     * CIE 1931 XYZ (see: <a href="https://en.wikipedia.org/wiki/CIE_1931_color_space">CIE 1931 color space</a>).  Note that this color space is only well-defined for floating point representations.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_XYZ => 10

    /**
     * DCI-P3
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_DCI_P3 => 11

    /**
     * Academy Color Encoding System
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_ACES => 12

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_Display_P3 => 13

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_Last => 14

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoPrimaries_ForceDWORD => 2147483647
}
