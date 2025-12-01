#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a list of words that can be used to improve the recognition result.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkwordlist-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkWordList extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
