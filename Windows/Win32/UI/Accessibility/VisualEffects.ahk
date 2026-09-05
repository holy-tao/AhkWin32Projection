#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the VisualEffects attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-visualeffects
 * @namespace Windows.Win32.UI.Accessibility
 */
class VisualEffects extends Win32Enum {

    /**
     * No visual effects
     * Native name: VisualEffects_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Shadow effect
     * Native name: VisualEffects_Shadow
     * @type {Integer (Int32)}
     */
    static Shadow => 1

    /**
     * Reflection effect
     * Native name: VisualEffects_Reflection
     * @type {Integer (Int32)}
     */
    static Reflection => 2

    /**
     * Glow effect
     * Native name: VisualEffects_Glow
     * @type {Integer (Int32)}
     */
    static Glow => 4

    /**
     * Soft edges effect
     * Native name: VisualEffects_SoftEdges
     * @type {Integer (Int32)}
     */
    static SoftEdges => 8

    /**
     * Bevel effect
     * Native name: VisualEffects_Bevel
     * @type {Integer (Int32)}
     */
    static Bevel => 16
}
