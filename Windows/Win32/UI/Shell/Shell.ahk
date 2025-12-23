#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the objects in the Shell. Methods are provided to control the Shell and to execute commands within the Shell. There are also methods to obtain other Shell-related objects.
 * @see https://learn.microsoft.com/windows/win32/shell/shell
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Shell extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
