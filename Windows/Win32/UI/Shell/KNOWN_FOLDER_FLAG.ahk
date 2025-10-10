#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specify special retrieval options for known folders. These values supersede CSIDL values, which have parallel meanings.
 * @remarks
 * 
  * These values, with the exception of KF_FLAG_ALIAS_ONLY, were defined in Windows Vista as individual constants. They are defined as an enumeration only in Windows 7 and later. However, all underlying numerical values are the same in either form.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ne-shlobj_core-known_folder_flag
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class KNOWN_FOLDER_FLAG{

    /**
     * 0x00000000. No flags.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_DEFAULT => 0

    /**
     * 0x00080000. Introduced in Windows 10, version 1709. When called from a packaged app, <b>LocalAppData/RoamingAppData</b> folders are redirected to private app locations that match the paths returned from <a href="https://docs.microsoft.com/uwp/api/Windows.Storage.ApplicationData">Windows.Storage.ApplicationData.Current{LocalFolder|RoamingFolder}</a>. Other folders are redirected to subdirectories of <b>LocalAppData</b>
 * 
 * This flag is used with <b>FOLDERID_AppDataDesktop</b>, <b>FOLDERID_AppDataDocuments</b>, <b>FOLDERID_AppDataFavorites</b>, and <b>FOLDERID_AppDataProgramData</b>. It is also intended for compatibility with .NET applications, and not meant to be used directly from an application.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_FORCE_APP_DATA_REDIRECTION => 524288

    /**
     * 0x00040000. <b>Introduced in Windows 10, version 1703</b>. When running in a Desktop Bridge process, some file system locations are redirected to package-specific locations by the file system. This flag will cause the target of the direction to be returned for those locations. This is useful in cases where the real location within the file system needs to be known.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_RETURN_FILTER_REDIRECTION_TARGET => 262144

    /**
     * 0x00020000. <b>Introduced in Windows 10, version 1703</b>. When running inside an AppContainer process, or when providing an AppContainer token, some folders are redirected to AppContainer-specific locations within the package. This flag will force with redirection for folders that are not normally redirected for the purposes of Desktop Bridge processes, and can be used for sharing files between UWA and Desktop Bridge apps within the same package. This flag is functionally identical to <b>KF_FLAG_FORCE_APPCONTAINER_REDIRECTION</b>.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_FORCE_PACKAGE_REDIRECTION => 131072

    /**
     * 0x00010000. <b>Introduced in Windows 10, version 1703</b>. When running inside a packaged process (such as a Desktop Bridge app or an AppContainer), or when providing a packaged process token, some folders are redirected to package-specific locations. This flag disables redirection on locations where it is applied, and instead returns the path that would be returned were it not running inside a packaged process. This flag is functionally identical to <b>KF_FLAG_NO_APPCONTAINER_REDIRECTION</b>.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_NO_PACKAGE_REDIRECTION => 65536

    /**
     * 0x00020000. Introduced in Windows 8. This flag is functionally identical to <b>KF_FLAG_FORCE_PACKAGE_REDIRECTION</b>, and was deprecated in Windows 10, version 1703.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_FORCE_APPCONTAINER_REDIRECTION => 131072

    /**
     * 0x00010000. <b>Introduced in Windows 8</b>. This flag is functionally identical to <b>KF_FLAG_NO_PACKAGE_REDIRECTION</b> and was deprecated in Windows 10, version 1703.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_NO_APPCONTAINER_REDIRECTION => 65536

    /**
     * 0x00008000. Forces the creation of the specified folder if that folder does not already exist. The security provisions predefined for that folder are applied. If the folder does not exist and cannot be created, the function returns a failure code and no path is returned. This value can be used only with the following functions and methods:
 *                         
 *                         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderidlist">SHGetKnownFolderIDList</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getidlist">IKnownFolder::GetIDList</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getpath">IKnownFolder::GetPath</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getshellitem">IKnownFolder::GetShellItem</a>
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static KF_FLAG_CREATE => 32768

    /**
     * 0x00004000. Do not verify the folder's existence before attempting to retrieve the path or IDList. If this flag is not set, an attempt is made to verify that the folder is truly present at the path. If that verification fails due to the folder being absent or inaccessible, the function returns a failure code and no path is returned.
 *               
 *                         
 * 
 * If the folder is located on a network, the function might take a longer time to execute. Setting this flag can reduce that lag time.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_DONT_VERIFY => 16384

    /**
     * 0x00002000. Stores the full path in the registry without using environment strings. If this flag is not set, portions of the path may be represented by environment strings such as %USERPROFILE%. This flag can only be used with <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shsetknownfolderpath">SHSetKnownFolderPath</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-setpath">IKnownFolder::SetPath</a>.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_DONT_UNEXPAND => 8192

    /**
     * 0x00001000. Gets the true system path for the folder, free of any aliased placeholders such as %USERPROFILE%, returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderidlist">SHGetKnownFolderIDList</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getidlist">IKnownFolder::GetIDList</a>. This flag has no effect on paths returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getpath">IKnownFolder::GetPath</a>. By default, known folder retrieval functions and methods return the aliased path if an alias exists.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_NO_ALIAS => 4096

    /**
     * 0x00000800. Initializes the folder using its Desktop.ini settings. If the folder cannot be initialized, the function returns a failure code and no path is returned. This flag should always be combined with KF_FLAG_CREATE.
 *         
 *             			
 * 
 * If the folder is located on a network, the function might take a longer time to execute.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_INIT => 2048

    /**
     * 0x00000400. Gets the default path for a known folder. If this flag is not set, the function retrieves the current—and possibly redirected—path of the folder. The execution of this flag includes a verification of the folder's existence unless KF_FLAG_DONT_VERIFY is set.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_DEFAULT_PATH => 1024

    /**
     * 0x00000200. Gets the folder's default path independent of the current location of its parent. KF_FLAG_DEFAULT_PATH must also be set.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_NOT_PARENT_RELATIVE => 512

    /**
     * 0x00000100. Build a simple IDList (PIDL) This value can be used when you want to retrieve the file system path but do not specify this value if you are retrieving the localized display name of the folder because it might not resolve correctly.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_SIMPLE_IDLIST => 256

    /**
     * 0x80000000. <b>Introduced in Windows 7</b>. Return only aliased PIDLs. Do not use the file system path.
     * @type {Integer (Int32)}
     */
    static KF_FLAG_ALIAS_ONLY => -2147483648
}
