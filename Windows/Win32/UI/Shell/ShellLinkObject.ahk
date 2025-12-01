#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Manages Shell links. This object makes much of the functionality of the IShellLink interface available to scripting applications.
 * @see https://learn.microsoft.com/windows/win32/shell/shelllinkobject-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellLinkObject extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
