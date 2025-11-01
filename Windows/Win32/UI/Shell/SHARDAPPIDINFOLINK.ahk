#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data used by SHAddToRecentDocs to identify both an item, in this case through an IShellLink, and the process that it is associated with.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> instance pointed to by <b>psl</b> must provide the following:
  * 
  *                 
  * 
  * <ul>
  * <li>Either a pointer to an item identifier list (PIDL) (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setidlist">IShellLink::SetIDList</a>) or the target path (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setpath">IShellLink::SetPath</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setrelativepath">IShellLink::SetRelativePath</a>)</li>
  * <li>Command-line arguments (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">IShellLink::SetArguments</a>)</li>
  * <li>Icon location  (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-seticonlocation">IShellLink::SetIconLocation</a>)</li>
  * </ul>
  * The display name must be set through the item's <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title (PKEY_Title)</a> property. The property can directly hold the display name or it can be an indirect string representation, such as "@shell32.dll,-1324", to use a stored string. An indirect string enables the item name to be displayed in the user's selected language.
  * 
  * Optionally, the description field (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setdescription">IShellLink::SetDescription</a>) can be set to provide a custom tooltip for the item in the Jump List.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shardappidinfolink
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHARDAPPIDINFOLINK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> instance that, when launched, opens the item. The shortcut is not added by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a> to the user's <b>Recent</b> folder (<a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL_RECENT</a>, <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_Recent</a>), but it is added to the <b>Recent</b> category in the specified application's Jump List.
     * @type {IShellLinkA}
     */
    psl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>PCWSTR</b>
     * 
     * The application-defined AppUserModelID associated with the item.
     * @type {PWSTR}
     */
    pszAppID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
