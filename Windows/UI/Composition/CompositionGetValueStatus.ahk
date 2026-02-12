#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the outcome of an attempt to retrieve the value of a key-value pair.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongetvaluestatus
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGetValueStatus extends Win32Enum{

    /**
     * The value successfully retrieved.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The value type of the key-value pair is different than the value type requested.
     * @type {Integer (Int32)}
     */
    static TypeMismatch => 1

    /**
     * The key-value pair does not exist.
     * @type {Integer (Int32)}
     */
    static NotFound => 2
}
