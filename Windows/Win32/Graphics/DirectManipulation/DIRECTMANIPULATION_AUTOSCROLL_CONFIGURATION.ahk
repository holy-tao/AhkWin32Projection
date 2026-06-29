#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the type and direction of automatic scrolling animation to apply.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_autoscroll_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If content is scrolling, slowly stop along the direction of the motion.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP => 0

    /**
     * Scroll towards the positive boundary of the content.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_FORWARD => 1

    /**
     * Scroll towards the origin of the content.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_REVERSE => 2
}
