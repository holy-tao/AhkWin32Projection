#Requires AutoHotkey v2.0.0 64-bit

/**
 * Value that represent a category by which a folder registered with the Known Folder system can be classified.
 * @remarks
 * 
 * The <b>KF_CATEGORY</b> type is defined in Shobjidl.h as shown here.
 * 
 *                 
 * 
 * 
 * ```
 * typedef DWORD KF_CATEGORY;
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-kf_category
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class KF_CATEGORY{

    /**
     * Virtual folders are not part of the file system, which is to say that they have no path. For example, <b>Control Panel</b> and <b>Printers</b> are virtual folders. A number of features such as folder path and redirection do not apply to this category.
     * @type {Integer (Int32)}
     */
    static KF_CATEGORY_VIRTUAL => 1

    /**
     * Fixed file system folders are not managed by the Shell and are usually given a permanent path when the system is installed. For example, the <b>Windows</b> and <b>Program Files</b> folders are fixed folders. A number of features such as redirection do not apply to this category.
     * @type {Integer (Int32)}
     */
    static KF_CATEGORY_FIXED => 2

    /**
     * Common folders are those file system folders used for sharing data and settings, accessible by all users of a system. For example, all users share a common <b>Documents</b> folder as well as their per-user <b>Documents</b> folder.
     * @type {Integer (Int32)}
     */
    static KF_CATEGORY_COMMON => 3

    /**
     * Per-user folders are those stored under each user's profile and accessible only by that user. For example, <c>%USERPROFILE%\Pictures</c>. This category of folder usually supports many features including aliasing, redirection and customization. 
     *                 
     *                 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The user profile root folder (<a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_Profile</a>) does not support redirection.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static KF_CATEGORY_PERUSER => 4
}
