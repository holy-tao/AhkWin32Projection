#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains folder view information.
 * @remarks
 * These settings assume a particular user interface, which the Shell's folder view has. A Shell extension can use these settings if they apply to the view implemented by the extension.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-foldersettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERSETTINGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * Folder view mode. One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a> values.
     * @type {Integer}
     */
    ViewMode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * A set of flags that indicate the options for the folder. This can be zero or a combination of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a> values.
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
