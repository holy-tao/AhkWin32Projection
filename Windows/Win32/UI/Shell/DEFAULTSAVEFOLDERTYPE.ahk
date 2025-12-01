#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the default save location.
 * @remarks
 * These values cannot be combined.
 * 
 * <h3><a id="Used_By"></a><a id="used_by"></a><a id="USED_BY"></a>Used By</h3>
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getdefaultsavefolder">IShellLibrary::GetDefaultSaveFolder</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setdefaultsavefolder">IShellLibrary::SetDefaultSaveFolder</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DEFAULTSAVEFOLDERTYPE extends Win32Enum{

    /**
     * The current user determines the save folder. If the current user is the library's owner,  use the private save location (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DSFT_PRIVATE</a>). If the current user is not the library's owner, use the public save location (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DSFT_PUBLIC</a>).
     * @type {Integer (Int32)}
     */
    static DSFT_DETECT => 1

    /**
     * The library's private save location, which can only be accessed by the library's owner.
     * @type {Integer (Int32)}
     */
    static DSFT_PRIVATE => 2

    /**
     * The library's public save location, which can be accessed by all users.
     * @type {Integer (Int32)}
     */
    static DSFT_PUBLIC => 3
}
