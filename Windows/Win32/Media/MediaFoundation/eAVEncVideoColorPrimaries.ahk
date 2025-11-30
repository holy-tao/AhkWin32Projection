#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color primaries of the video. This enumeration is used with the AVEncVideoInputColorPrimaries and AVEncVideoOutputColorPrimaries properties.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencvideocolorprimaries
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoColorPrimaries extends Win32Enum{

    /**
     * Use the same primaries as the input video. This flag applies to the <b>AVEncVideoOutputColorPrimaries</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_SameAsSource => 0

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_Reserved => 1

    /**
     * ITU-R BT.709 (including sRGB and scRGB).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_BT709 => 2

    /**
     * ITU-R.BT.470-4 System M (NTSC).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_BT470_2_SysM => 3

    /**
     * ITU-R.BT.470-4 System B,G (NTSC).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_BT470_2_SysBG => 4

    /**
     * SMPTE 170M.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_SMPTE170M => 5

    /**
     * SMPTE 240M.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_SMPTE240M => 6

    /**
     * EBU 3213.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_EBU3231 => 7

    /**
     * SPMTE C (NTSC).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorPrimaries_SMPTE_C => 8
}
