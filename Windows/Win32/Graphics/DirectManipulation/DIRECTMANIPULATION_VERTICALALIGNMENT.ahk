#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the vertical alignment settings for content within the viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_verticalalignment
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_VERTICALALIGNMENT{

    /**
     * No alignment. The object can be positioned anywhere within the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VERTICALALIGNMENT_NONE => 0

    /**
     * Align object along the top of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VERTICALALIGNMENT_TOP => 1

    /**
     * Align object to the center of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER => 2

    /**
     * Align object along the bottom of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM => 4

    /**
     * Content zooms around the center point of the contacts, instead of being locked with the vertical alignment.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER => 8
}
