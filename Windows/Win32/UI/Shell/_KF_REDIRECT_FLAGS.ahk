#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags used by IKnownFolderManager::Redirect to specify details of a known folder redirection such as permissions and ownership for the redirected folder.
 * @remarks
 * The <b><b>KF_REDIRECT_OWNER_USER</b></b> and <b><b>KF_REDIRECT_SET_OWNER_EXPLICIT</b></b> flags provide ownership checks for the target folder, if that folder exists. By default, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-redirect">IKnownFolderManager::Redirect</a> does not perform ownership checks. KF_REDIRECT_OWNER_USER and KF_REDIRECT_SET_OWNER_EXPLICIT are only valid if called together.
  * 
  * The <b>KF_REDIRECT_FLAGS</b> type is defined in Shobjidl.h as shown here.
  * 
  * 
  * ```
  * typedef DWORD KF_REDIRECT_FLAGS;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_REDIRECT_FLAGS{

    /**
     * Ensure that only the user has permission to access the redirected folder.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_USER_EXCLUSIVE => 1

    /**
     * Copy the DACL of the source folder to the target to maintain current access permissions.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_COPY_SOURCE_DACL => 2

    /**
     * Sets the user as the owner of a newly created target folder unless the user is a member of the Administrator group, in which case Administrator is set as the owner. Must be called with KF_REDIRECT_SET_OWNER_EXPLICIT.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_OWNER_USER => 4

    /**
     * Set the owner of a newly created target folder.  If the user belongs to the Administrators group, Administrators is assigned as the owner. Must be called with KF_REDIRECT_OWNER_USER.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_SET_OWNER_EXPLICIT => 8

    /**
     * Do not perform a redirection, simply check whether redirection has occurred. If so, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-redirect">IKnownFolderManager::Redirect</a> returns S_OK; if not, or if some actions remain to be completed, it returns S_FALSE.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_CHECK_ONLY => 16

    /**
     * Display UI during the redirection.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_WITH_UI => 32

    /**
     * Unpin the source folder.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_UNPIN => 64

    /**
     * Pin the target folder.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_PIN => 128

    /**
     * Copy the existing contents—both files and subfolders—of the known folder to the redirected folder.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_COPY_CONTENTS => 512

    /**
     * Delete the contents of the source folder after they have been copied to the redirected folder. This flag is valid only if <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags">KF_REDIRECT_COPY_CONTENTS</a> is set.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_DEL_SOURCE_CONTENTS => 1024

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS => 2048
}
