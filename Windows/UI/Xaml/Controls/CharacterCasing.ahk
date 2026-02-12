#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a control modifies the case of characters as they are typed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.charactercasing
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CharacterCasing extends Win32Enum{

    /**
     * The case of characters is left unchanged.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Characters are changed to lowercase.
     * @type {Integer (Int32)}
     */
    static Lower => 1

    /**
     * Characters are changed to uppercase.
     * @type {Integer (Int32)}
     */
    static Upper => 2
}
