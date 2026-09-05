#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_DM_IT_FIRST_FRAME_COHERENCY extends Win32Enum {

    /**
     * Native name: WM_DM_IT_DISABLE_COHERENT_MODE
     * @type {Integer (Int32)}
     */
    static DISABLE_COHERENT_MODE => 0

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_AA_TOP => 1

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_BB_TOP => 2

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_BC_TOP => 3

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_CD_TOP => 4

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_DD_TOP => 5

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_AA_BOTTOM => 6

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_BB_BOTTOM => 7

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_BC_BOTTOM => 8

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_CD_BOTTOM => 9

    /**
     * Native name: WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM
     * @type {Integer (Int32)}
     */
    static IN_CLIP_IS_DD_BOTTOM => 10
}
