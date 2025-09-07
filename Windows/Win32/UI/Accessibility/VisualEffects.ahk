#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values for the VisualEffects attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-visualeffects
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class VisualEffects{

    /**
     * No visual effects
     * @type {Integer (Int32)}
     */
    static VisualEffects_None => 0

    /**
     * Shadow effect
     * @type {Integer (Int32)}
     */
    static VisualEffects_Shadow => 1

    /**
     * Reflection effect
     * @type {Integer (Int32)}
     */
    static VisualEffects_Reflection => 2

    /**
     * Glow effect
     * @type {Integer (Int32)}
     */
    static VisualEffects_Glow => 4

    /**
     * Soft edges effect
     * @type {Integer (Int32)}
     */
    static VisualEffects_SoftEdges => 8

    /**
     * Bevel effect
     * @type {Integer (Int32)}
     */
    static VisualEffects_Bevel => 16
}
