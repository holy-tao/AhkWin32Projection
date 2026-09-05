#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color primaries of a video source. (MFVideoPrimaries)
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-primaries-attribute">MF_MT_VIDEO_PRIMARIES</a> attribute.
 * 
 * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videoprimaries">DXVA2_VideoPrimaries</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideoprimaries
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoPrimaries extends Win32Enum {

    /**
     * The color primaries are unknown.
     * Native name: MFVideoPrimaries_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Reserved.
     * Native name: MFVideoPrimaries_reserved
     * @type {Integer (Int32)}
     */
    static reserved => 1

    /**
     * ITU-R BT.709. Also used for sRGB and scRGB.
     * Native name: MFVideoPrimaries_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 2

    /**
     * ITU-R BT.470-4 System M (NTSC).
     * Native name: MFVideoPrimaries_BT470_2_SysM
     * @type {Integer (Int32)}
     */
    static BT470_2_SysM => 3

    /**
     * ITU-R BT.470-4 System B,G (NTSC).
     * Native name: MFVideoPrimaries_BT470_2_SysBG
     * @type {Integer (Int32)}
     */
    static BT470_2_SysBG => 4

    /**
     * SMPTE 170M.
     * Native name: MFVideoPrimaries_SMPTE170M
     * @type {Integer (Int32)}
     */
    static SMPTE170M => 5

    /**
     * SMPTE 240M.
     * Native name: MFVideoPrimaries_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 6

    /**
     * EBU 3213.
     * Native name: MFVideoPrimaries_EBU3213
     * @type {Integer (Int32)}
     */
    static EBU3213 => 7

    /**
     * SMPTE C (SMPTE RP 145).
     * Native name: MFVideoPrimaries_SMPTE_C
     * @type {Integer (Int32)}
     */
    static SMPTE_C => 8

    /**
     * ITU-R BT.2020 color primaries.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
     * <div> </div>
     * Native name: MFVideoPrimaries_BT2020
     * @type {Integer (Int32)}
     */
    static BT2020 => 9

    /**
     * CIE 1931 XYZ (see: <a href="https://en.wikipedia.org/wiki/CIE_1931_color_space">CIE 1931 color space</a>).  Note that this color space is only well-defined for floating point representations.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
     * <div> </div>
     * Native name: MFVideoPrimaries_XYZ
     * @type {Integer (Int32)}
     */
    static XYZ => 10

    /**
     * DCI-P3
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
     * <div> </div>
     * Native name: MFVideoPrimaries_DCI_P3
     * @type {Integer (Int32)}
     */
    static DCI_P3 => 11

    /**
     * Academy Color Encoding System
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 10, version 1703 or later.</div>
     * <div> </div>
     * Native name: MFVideoPrimaries_ACES
     * @type {Integer (Int32)}
     */
    static ACES => 12

    /**
     * Native name: MFVideoPrimaries_Display_P3
     * @type {Integer (Int32)}
     */
    static Display_P3 => 13

    /**
     * Reserved.
     * Native name: MFVideoPrimaries_Last
     * @type {Integer (Int32)}
     */
    static Last => 14

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * Native name: MFVideoPrimaries_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
