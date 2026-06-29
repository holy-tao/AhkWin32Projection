#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KF_CATEGORY.ahk" { KF_CATEGORY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the specifics of a known folder.
 * @remarks
 * The <b>fidParent</b> and <b>pszRelativePath</b> values work together. For example, suppose you are defining a folder called MyNewFolder and want to create that folder as ...\&lt;Username&gt;\AppData\Local\MyApp\MyNewFolder. Provide <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_LocalAppData</a> in <b>fidParent</b> to represent ...\&lt;Username&gt;\AppData\Local. Provide "\MyApp\MyNewFolder" in <b>pszRelativePath</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition
 * @namespace Windows.Win32.UI.Shell
 */
export default struct KNOWNFOLDER_DEFINITION {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a></b>
     * 
     * A single value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a> constants that classifies the folder as virtual, fixed, common, or per-user.
     */
    category : KF_CATEGORY

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the non-localized, canonical name for the known folder, stored as a null-terminated Unicode string. If this folder is a common or per-user folder, this value is also used as the value name of the "User Shell Folders" registry settings. This name is meant to be a unique, human-readable name. Third parties are recommended to follow the format <c>Company.Application.Name</c>. The name given here should not be confused with the display name.
     */
    pszName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a short description of the known folder, stored as a null-terminated Unicode string. This description should include the folder's purpose and usage.
     */
    pszDescription : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> value that names another known folder to serve as the parent folder. Applies to common and per-user folders only. This value is used in conjunction with <b>pszRelativePath</b>. See <b>Remarks</b> for more details.
     *                         
     *                         
     * 
     * This value is optional if no value is provided for <b>pszRelativePath</b>.
     */
    fidParent : Guid

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to a path relative to the parent folder specified in <b>fidParent</b>. This is a null-terminated Unicode string, refers to the physical file system path, and is not localized. Applies to common and per-user folders only. See <b>Remarks</b> for more details.
     */
    pszRelativePath : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the Shell namespace folder path of the folder, stored as a null-terminated Unicode string. Applies to virtual folders only. For example, <c>Control Panel</code> has a parsing name of <code>::%CLSID_MyComputer%\::%CLSID_ControlPanel%</c>.
     */
    pszParsingName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to the default tooltip resource used for this known folder when it is created. This is a null-terminated Unicode string in this form:
     *     
     *                         
     * 
     * <b>Module name, Resource ID</b>
     * 
     * For example, <c>@%_SYS_MOD_PATH%,-12688</c> is the tooltip for Common Pictures. When the folder is created, this string is stored in that folder's copy of Desktop.ini. It can be changed later by other Shell APIs. This resource might be localized.
     * 
     * This information is not required for virtual folders.
     */
    pszTooltip : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to the default localized name resource used when the folder is created. This is a null-terminated Unicode string in this form:
     *     
     *                         
     * 
     * <b>Module name, Resource ID</b>
     * 
     * When the folder is created, this string is stored in that folder's copy of Desktop.ini. It can be changed later by other Shell APIs.
     * 
     * This information is not required for virtual folders.
     */
    pszLocalizedName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to the default icon resource used when the folder is created. This is a null-terminated Unicode string in this form:
     *     
     *                         
     * 
     * <b>Module name, Resource ID</b>
     * 
     * When the folder is created, this string is stored in that folder's copy of Desktop.ini. It can be changed later by other Shell APIs.
     * 
     * This information is not required for virtual folders.
     */
    pszIcon : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-definition-language">Security Descriptor Definition Language</a> format string. This is a null-terminated Unicode string that describes the default security descriptor that the folder receives when it is created. If this parameter is <b>NULL</b>, the new folder inherits the security descriptor of its parent. This is particularly useful for common folders that are accessed by all users.
     */
    pszSecurity : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Optional. Default file system attributes given to the folder when it is created. For example, the file could be hidden and read-only (FILE_ATTRIBUTE_HIDDEN and FILE_ATTRIBUTE_READONLY). For a complete list of possible values, see the <i>dwFlagsAndAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. Set to -1 if not needed.
     */
    dwAttributes : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags">KF_DEFINITION_FLAGS</a></b>
     * 
     * Optional. One of more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags">KF_DEFINITION_FLAGS</a> enumeration that allow you to restrict redirection, allow PC-to-PC roaming, and control the time at which the known folder is created. Set to 0 if not needed.
     */
    kfdFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> values that identifies the known folder type based on its contents (such as documents, music, or photographs). This value is a GUID.
     */
    ftidType : Guid

}
