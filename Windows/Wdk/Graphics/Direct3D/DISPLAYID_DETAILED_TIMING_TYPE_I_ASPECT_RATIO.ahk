#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DISPLAYID_DETAILED_TIMING_TYPE_I_ASPECT_RATIO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_1x1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_5x4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_4x3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_15x9 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_16x9 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_16x10 => 5
}
