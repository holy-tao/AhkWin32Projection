#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_DM_IT_FIRST_FRAME_COHERENCY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_DISABLE_COHERENT_MODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP => 5

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM => 7

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM => 8

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM => 9

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM => 10
}
