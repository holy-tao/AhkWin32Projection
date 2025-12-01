#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a collection of the open windows that belong to the Shell. Methods associated with this objects can control and execute commands within the Shell, and obtain other Shell-related objects.
 * @see https://learn.microsoft.com/windows/win32/shell/shellwindows
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellWindows extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
