#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The mode for the Morphology effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_morphology_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_MORPHOLOGY_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The maximum value from each RGB channel in the kernel is used.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_MODE_ERODE => 0

    /**
     * The minimum value from each RGB channel in the kernel is used.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_MODE_DILATE => 1
}
