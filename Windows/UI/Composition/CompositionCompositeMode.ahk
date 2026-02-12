#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines how a non-opaque visual's content is blended with the background content behind the visual.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncompositemode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionCompositeMode extends Win32Enum{

    /**
     * Inherits mode from parent visual.
     * @type {Integer (Int32)}
     */
    static Inherit => 0

    /**
     * The standard Composite Mode. Colors are blended with per-pixel transparency.
     * @type {Integer (Int32)}
     */
    static SourceOver => 1

    /**
     * The visual content's colors are inverted.
     * @type {Integer (Int32)}
     */
    static DestinationInvert => 2

    /**
     * Visual content's colors subtract for color channels in the background.
     * @type {Integer (Int32)}
     */
    static MinBlend => 3
}
