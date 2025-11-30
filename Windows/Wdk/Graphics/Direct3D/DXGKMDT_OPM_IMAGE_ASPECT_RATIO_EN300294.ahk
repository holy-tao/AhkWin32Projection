#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_IMAGE_ASPECT_RATIO_EN300294 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_CENTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_TOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_CENTER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_TOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_BOX_GT_16_BY_9_CENTER => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3_PROTECTED_CENTER => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_16_BY_9_ANAMORPHIC => 7
}
