#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Extends the FolderItem object. In addition to the properties and methods supported by FolderItem, ShellFolderItem has two additional methods.
 * @see https://learn.microsoft.com/windows/win32/shell/shellfolderitem-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellFolderItem extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
