#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in the BP_ANIMATIONPARAMS structure to declare animation options.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ne-uxtheme-bp_animationstyle
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BP_ANIMATIONSTYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No animation. Not implemented in Windows Vista.
     * @type {Integer (Int32)}
     */
    static BPAS_NONE => 0

    /**
     * Linear fade animation.
     * @type {Integer (Int32)}
     */
    static BPAS_LINEAR => 1

    /**
     * Cubic fade animation. Not implemented in Windows Vista.
     * @type {Integer (Int32)}
     */
    static BPAS_CUBIC => 2

    /**
     * Sinusoid fade animation. Not implemented in Windows Vista.
     * @type {Integer (Int32)}
     */
    static BPAS_SINE => 3
}
