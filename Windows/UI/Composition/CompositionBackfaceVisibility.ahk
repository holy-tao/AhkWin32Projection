#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether the back face of a visual is visible during a 3D transform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbackfacevisibility
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBackfaceVisibility extends Win32Enum{

    /**
     * Inherit the back face visibility value.
     * @type {Integer (Int32)}
     */
    static Inherit => 0

    /**
     * The back face should be visible during a 3D transform.
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * The back face should not be visible during a 3D transform.
     * @type {Integer (Int32)}
     */
    static Hidden => 2
}
