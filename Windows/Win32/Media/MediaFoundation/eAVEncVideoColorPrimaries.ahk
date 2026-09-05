#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color primaries of the video. This enumeration is used with the AVEncVideoInputColorPrimaries and AVEncVideoOutputColorPrimaries properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolorprimaries
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoColorPrimaries extends Win32Enum {

    /**
     * Use the same primaries as the input video. This flag applies to the <b>AVEncVideoOutputColorPrimaries</b> property only.
     * Native name: eAVEncVideoColorPrimaries_SameAsSource
     * @type {Integer (Int32)}
     */
    static SameAsSource => 0

    /**
     * Reserved. Do not use.
     * Native name: eAVEncVideoColorPrimaries_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 1

    /**
     * ITU-R BT.709 (including sRGB and scRGB).
     * Native name: eAVEncVideoColorPrimaries_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 2

    /**
     * ITU-R.BT.470-4 System M (NTSC).
     * Native name: eAVEncVideoColorPrimaries_BT470_2_SysM
     * @type {Integer (Int32)}
     */
    static BT470_2_SysM => 3

    /**
     * ITU-R.BT.470-4 System B,G (NTSC).
     * Native name: eAVEncVideoColorPrimaries_BT470_2_SysBG
     * @type {Integer (Int32)}
     */
    static BT470_2_SysBG => 4

    /**
     * SMPTE 170M.
     * Native name: eAVEncVideoColorPrimaries_SMPTE170M
     * @type {Integer (Int32)}
     */
    static SMPTE170M => 5

    /**
     * SMPTE 240M.
     * Native name: eAVEncVideoColorPrimaries_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 6

    /**
     * EBU 3213.
     * Native name: eAVEncVideoColorPrimaries_EBU3231
     * @type {Integer (Int32)}
     */
    static EBU3231 => 7

    /**
     * SPMTE C (NTSC).
     * Native name: eAVEncVideoColorPrimaries_SMPTE_C
     * @type {Integer (Int32)}
     */
    static SMPTE_C => 8
}
