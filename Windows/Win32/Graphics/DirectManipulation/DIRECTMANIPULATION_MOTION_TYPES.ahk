#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the Direct Manipulation motion type.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_MOTION_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_NONE => 0

    /**
     * Translation in the horizontal axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_TRANSLATEX => 1

    /**
     * Translation in the vertical axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_TRANSLATEY => 2

    /**
     * Zoom.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_ZOOM => 4

    /**
     * The horizontal center of the manipulation.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_CENTERX => 16

    /**
     * The vertical center of the manipulation.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_CENTERY => 32

    /**
     * All manipulation motion.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_ALL => 55
}
