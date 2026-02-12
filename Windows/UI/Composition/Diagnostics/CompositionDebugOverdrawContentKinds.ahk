#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kinds of content are shown on an overdraw heatmap.
 * @remarks
 * This enumeration allows a bitwise combination of its member values.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugoverdrawcontentkinds
 * @namespace Windows.UI.Composition.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CompositionDebugOverdrawContentKinds extends Win32BitflagEnum{

    /**
     * No content kinds are shown.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Elements rendered offscreen are shown.
     * @type {Integer (UInt32)}
     */
    static OffscreenRendered => 1

    /**
     * Colors are shown.
     * @type {Integer (UInt32)}
     */
    static Colors => 2

    /**
     * Effects are shown.
     * @type {Integer (UInt32)}
     */
    static Effects => 4

    /**
     * Shadows are shown.
     * @type {Integer (UInt32)}
     */
    static Shadows => 8

    /**
     * Lights are shown.
     * @type {Integer (UInt32)}
     */
    static Lights => 16

    /**
     * Surfaces are shown.
     * @type {Integer (UInt32)}
     */
    static Surfaces => 32

    /**
     * SwapChains are shown.
     * @type {Integer (UInt32)}
     */
    static SwapChains => 64

    /**
     * All content kinds are shown.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}
