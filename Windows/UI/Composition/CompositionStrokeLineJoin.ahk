#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the shape used to join two lines or segments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionstrokelinejoin
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionStrokeLineJoin extends Win32Enum{

    /**
     * Line joins use regular angular vertices.
     * @type {Integer (Int32)}
     */
    static Miter => 0

    /**
     * Line joins use beveled vertices.
     * @type {Integer (Int32)}
     */
    static Bevel => 1

    /**
     * Line joins use rounded vertices.
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Line joins use regular angular vertices unless the join would extend beyond the miter limit; otherwise, line joins use beveled vertices.
     * @type {Integer (Int32)}
     */
    static MiterOrBevel => 3
}
