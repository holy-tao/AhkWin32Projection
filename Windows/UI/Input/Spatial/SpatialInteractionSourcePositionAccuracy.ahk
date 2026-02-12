#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the accuracy of an interaction source's positional tracking.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcepositionaccuracy
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourcePositionAccuracy extends Win32Enum{

    /**
     * The interaction source's position is being tracked at its nominal accuracy.
     * @type {Integer (Int32)}
     */
    static High => 0

    /**
     * The interaction source's position is only being tracked approximately, with either an inferred or body-locked position.
     * @type {Integer (Int32)}
     */
    static Approximate => 1
}
