#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Implemented by the Shell to help script and Microsoft Visual Basic developers use some of the features available in the Shell. The ShellUIHelper object does not have any properties or events. Methods are provided to add items to the Shell.
 * @see https://learn.microsoft.com/windows/win32/shell/shelluihelper
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellUIHelper extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
