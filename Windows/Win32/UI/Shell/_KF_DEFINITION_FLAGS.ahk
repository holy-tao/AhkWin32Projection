#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that specify certain known folder behaviors. Used with the KNOWNFOLDER_DEFINITION structure.
 * @remarks
 * The <b>KF_DEFINITION_FLAGS</b> type is defined in Shobjidl.h as shown here.
 * 
 * 
 * ```
 * typedef DWORD KF_DEFINITION_FLAGS;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_DEFINITION_FLAGS extends Win32Enum{

    /**
     * Prevent a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">per-user</a> known folder from being redirected to a network location. Note that if the known folder has been flagged with KFDF_LOCAL_REDIRECT_ONLY but it is a subfolder of a known folder that is redirected to a network location, this subfolder is redirected also.
     * @type {Integer (Int32)}
     */
    static KFDF_LOCAL_REDIRECT_ONLY => 2

    /**
     * Can be roamed through a PC-to-PC synchronization.
     * @type {Integer (Int32)}
     */
    static KFDF_ROAMABLE => 4

    /**
     * Create the folder when the user first logs on. Normally a known folder is not created until it is first called. At that time, an API such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getshellitem">IKnownFolder::GetShellItem</a> is called with the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-known_folder_flag">KF_FLAG_CREATE</a> flag. However, some known folders need to exist immediately. An example is those known folders under %USERPROFILE%, which must exist to provide a proper view. In those cases, KFDF_PRECREATE is set and Windows Explorer calls the creation API during its user initialization.
     * @type {Integer (Int32)}
     */
    static KFDF_PRECREATE => 8

    /**
     * <b>Introduced in Windows 7</b>. The known folder is a file rather than a folder.
     * @type {Integer (Int32)}
     */
    static KFDF_STREAM => 16

    /**
     * <b>Introduced in Windows 7</b>. The full path of the known folder, with any environment variables fully expanded, is stored in the registry under HKEY_CURRENT_USER.
     * @type {Integer (Int32)}
     */
    static KFDF_PUBLISHEXPANDEDPATH => 32

    /**
     * <b>Introduced in Windows 8.1</b>. Prevent showing the <b>Locations</b> tab in the property dialog of the known folder.
     * @type {Integer (Int32)}
     */
    static KFDF_NO_REDIRECT_UI => 64
}
