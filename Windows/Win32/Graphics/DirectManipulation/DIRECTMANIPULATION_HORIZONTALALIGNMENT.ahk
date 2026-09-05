#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the horizontal alignment options for content within a viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_horizontalalignment
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_HORIZONTALALIGNMENT extends Win32BitflagEnum {

    /**
     * No alignment. The object can be positioned anywhere within the viewport.
     * Native name: DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Align object along the left side of the viewport.
     * Native name: DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT
     * @type {Integer (Int32)}
     */
    static LEFT => 1

    /**
     * Align object to the center of the viewport.
     * Native name: DIRECTMANIPULATION_HORIZONTALALIGNMENT_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 2

    /**
     * Align object along the right side of the viewport.
     * Native name: DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT
     * @type {Integer (Int32)}
     */
    static RIGHT => 4

    /**
     * Content zooms around the center point of the contacts, instead of being locked with the horizontal alignment.
     * Native name: DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER
     * @type {Integer (Int32)}
     */
    static UNLOCKCENTER => 8
}
