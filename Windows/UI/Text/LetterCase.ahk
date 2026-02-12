#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the character case formatting.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.lettercase
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class LetterCase extends Win32Enum{

    /**
     * Lowercase characters.
     * @type {Integer (Int32)}
     */
    static Lower => 0

    /**
     * Uppercase characters.
     * @type {Integer (Int32)}
     */
    static Upper => 1
}
