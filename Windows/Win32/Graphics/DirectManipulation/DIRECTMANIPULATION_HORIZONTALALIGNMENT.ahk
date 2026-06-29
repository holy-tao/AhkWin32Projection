#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the horizontal alignment options for content within a viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_horizontalalignment
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_HORIZONTALALIGNMENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No alignment. The object can be positioned anywhere within the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE => 0

    /**
     * Align object along the left side of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT => 1

    /**
     * Align object to the center of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HORIZONTALALIGNMENT_CENTER => 2

    /**
     * Align object along the right side of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT => 4

    /**
     * Content zooms around the center point of the contacts, instead of being locked with the horizontal alignment.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER => 8
}
