#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used in the BP_ANIMATIONPARAMS structure to declare animation options.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ne-uxtheme-bp_animationstyle
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BP_ANIMATIONSTYLE{

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
