#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Controls the aliasing behavior on the edges of visual borders.
  * <!--  with other visuals and affects pixel precise alignment so that edges (borders) are not axis-aligned to avoid aliasing. -->
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbordermode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBorderMode extends Win32Enum{

    /**
     * Inherit from parent.
     * @type {Integer (Int32)}
     */
    static Inherit => 0

    /**
     * Bitmap and clip edges are antialiased.
     * @type {Integer (Int32)}
     */
    static Soft => 1

    /**
     * Bitmap and clip edges are aliased.
     * @type {Integer (Int32)}
     */
    static Hard => 2
}
