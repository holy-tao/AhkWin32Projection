#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction in which item generation will occur.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.generatordirection
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GeneratorDirection extends Win32Enum{

    /**
     * Items are generated in a forward direction.
     * @type {Integer (Int32)}
     */
    static Forward => 0

    /**
     * Items are generated in a backward direction.
     * @type {Integer (Int32)}
     */
    static Backward => 1
}
