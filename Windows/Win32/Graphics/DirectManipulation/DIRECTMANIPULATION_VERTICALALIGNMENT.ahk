#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the vertical alignment settings for content within the viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_verticalalignment
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_VERTICALALIGNMENT extends Win32BitflagEnum {

    /**
     * No alignment. The object can be positioned anywhere within the viewport.
     * Native name: DIRECTMANIPULATION_VERTICALALIGNMENT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Align object along the top of the viewport.
     * Native name: DIRECTMANIPULATION_VERTICALALIGNMENT_TOP
     * @type {Integer (Int32)}
     */
    static TOP => 1

    /**
     * Align object to the center of the viewport.
     * Native name: DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 2

    /**
     * Align object along the bottom of the viewport.
     * Native name: DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM
     * @type {Integer (Int32)}
     */
    static BOTTOM => 4

    /**
     * Content zooms around the center point of the contacts, instead of being locked with the vertical alignment.
     * Native name: DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER
     * @type {Integer (Int32)}
     */
    static UNLOCKCENTER => 8
}
