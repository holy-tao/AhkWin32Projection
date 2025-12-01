#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The StringCollection object provides a way to manipulate a collection of strings.
 * @see https://learn.microsoft.com/windows/win32/WMP/stringcollection-object
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class StringCollection extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
