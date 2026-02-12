#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the gradient brush's positioning coordinates (StartPoint, EndPoint) are absolute or relative to the output area.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmappingmode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionMappingMode extends Win32Enum{

    /**
     * Positioning coordinates (StartPoint, EndPoint) are absolute.
     * @type {Integer (Int32)}
     */
    static Absolute => 0

    /**
     * Positioning coordinates (StartPoint, EndPoint) are relative to the output area.
     * @type {Integer (Int32)}
     */
    static Relative => 1
}
