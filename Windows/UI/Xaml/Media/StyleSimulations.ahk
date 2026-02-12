#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the simulation style of a font.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.stylesimulations
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class StyleSimulations extends Win32Enum{

    /**
     * No font style simulation.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Bold style simulation.
     * @type {Integer (Int32)}
     */
    static BoldSimulation => 1

    /**
     * Italic style simulation.
     * @type {Integer (Int32)}
     */
    static ItalicSimulation => 2

    /**
     * Bold and italic style simulation.
     * @type {Integer (Int32)}
     */
    static BoldItalicSimulation => 3
}
