#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the interpretation of the data passed by SHAddToRecentDocs in its pv parameter to identify the item whose usage statistics are being tracked.
 * @remarks
 * Before Windows 7, SHARD_PIDL, SHARD_PATHA, and SHARD_PATHW were defined as individual constants, not as enumeration members.
 * 
 * When providing an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> through either <b><b>SHARD_LINK</b></b> or <b><b>SHARD_APPIDINFOLINK</b></b>, the <b>IShellLink</b> instance must provide the following:
 * 
 *                 
 * 
 * <ul>
 * <li>Either a PIDL (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setidlist">IShellLink::SetIDList</a>) or the target path (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setpath">IShellLink::SetPath</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setrelativepath">IShellLink::SetRelativePath</a>)</li>
 * <li>Command-line arguments (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">IShellLink::SetArguments</a>)</li>
 * <li>Icon location  (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-seticonlocation">IShellLink::SetIconLocation</a>)</li>
 * </ul>
 * The display name must be set through the item's <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title (PKEY_Title)</a> property. The property can directly hold the display name or it can be an indirect string representation, such as "@shell32.dll,-1324", to use a stored string. An indirect string enables the item name to be displayed in the user's selected language.
 * 
 * Optionally, the description field (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setdescription">IShellLink::SetDescription</a>) can be set to provide a custom tooltip for the item in the Jump List.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-shard
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHARD extends Win32Enum{

    /**
     * The <i>pv</i> parameter points to a PIDL that identifies the document's file object. PIDLs that identify non-file objects are not accepted.
     * @type {Integer (Int32)}
     */
    static SHARD_PIDL => 1

    /**
     * The <i>pv</i> parameter points to a null-terminated ANSI string with the path and file name of the object.
     * @type {Integer (Int32)}
     */
    static SHARD_PATHA => 2

    /**
     * The <i>pv</i> parameter points to a null-terminated Unicode string with the path and file name of the object.
     * @type {Integer (Int32)}
     */
    static SHARD_PATHW => 3

    /**
     * <b>Windows 7 and later</b>. The <i>pv</i> parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shardappidinfo">SHARDAPPIDINFO</a> structure that pairs an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that identifies the item with an AppUserModelID that associates it with a particular process or application.
     * @type {Integer (Int32)}
     */
    static SHARD_APPIDINFO => 4

    /**
     * <b>Windows 7 and later</b>. The <i>pv</i> parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shardappidinfoidlist">SHARDAPPIDINFOIDLIST</a> structure that pairs an absolute PIDL that identifies the item with an AppUserModelID that associates it with a particular process or application.
     * @type {Integer (Int32)}
     */
    static SHARD_APPIDINFOIDLIST => 5

    /**
     * <b>Windows 7 and later</b>. The <i>pv</i> parameter is an interface pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> object.
     * @type {Integer (Int32)}
     */
    static SHARD_LINK => 6

    /**
     * <b>Windows 7 and later</b>. The <i>pv</i> parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shardappidinfolink">SHARDAPPIDINFOLINK</a> structure that pairs an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> that identifies the item with an AppUserModelID that associates it with a particular process or application.
     * @type {Integer (Int32)}
     */
    static SHARD_APPIDINFOLINK => 7

    /**
     * <b>Windows 7 and later</b>. The <i>pv</i> parameter is an interface pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object.
     * @type {Integer (Int32)}
     */
    static SHARD_SHELLITEM => 8
}
