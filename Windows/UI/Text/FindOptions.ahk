#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the options to use when doing a text search.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.findoptions
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FindOptions extends Win32BitflagEnum{

    /**
     * Use the default text search options; namely, use case- independent, arbitrary character boundaries.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Match whole words.
     * @type {Integer (UInt32)}
     */
    static Word => 2

    /**
     * Match case; that is, a case-sensitive search.
     * @type {Integer (UInt32)}
     */
    static Case => 4
}
