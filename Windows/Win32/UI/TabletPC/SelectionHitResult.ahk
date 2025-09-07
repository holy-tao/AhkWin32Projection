#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which part of a selection, if any, was hit during a hit test.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-selectionhitresult
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class SelectionHitResult{

    /**
     * No part of the selection was hit.
     * @type {Integer (Int32)}
     */
    static SHR_None => 0

    /**
     * The northwest corner sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_NW => 1

    /**
     * The southeast corner sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_SE => 2

    /**
     * The northeast corner sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_NE => 3

    /**
     * That the southwest corner sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_SW => 4

    /**
     * The east side sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_E => 5

    /**
     * The west side sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_W => 6

    /**
     * The north side sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_N => 7

    /**
     * The south side sizing handle was hit.
     * @type {Integer (Int32)}
     */
    static SHR_S => 8

    /**
     * The selection itself was hit (no selection handle was hit).
     * @type {Integer (Int32)}
     */
    static SHR_Selection => 9
}
