#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the specifics of a known folder.
 * @remarks
 * The <b>fidParent</b> and <b>pszRelativePath</b> values work together. For example, suppose you are defining a folder called MyNewFolder and want to create that folder as ...\&lt;Username&gt;\AppData\Local\MyApp\MyNewFolder. Provide <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_LocalAppData</a> in <b>fidParent</b> to represent ...\&lt;Username&gt;\AppData\Local. Provide "\MyApp\MyNewFolder" in <b>pszRelativePath</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class KNOWNFOLDER_DEFINITION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a></b>
     * 
     * A single value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-kf_category">KF_CATEGORY</a> constants that classifies the folder as virtual, fixed, common, or per-user.
     * @type {Integer}
     */
    category {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the non-localized, canonical name for the known folder, stored as a null-terminated Unicode string. If this folder is a common or per-user folder, this value is also used as the value name of the "User Shell Folders" registry settings. This name is meant to be a unique, human-readable name. Third parties are recommended to follow the format <c>Company.Application.Name</c>. The name given here should not be confused with the display name.
     * @type {Pointer<PWSTR>}
     */
    pszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a short description of the known folder, stored as a null-terminated Unicode string. This description should include the folder's purpose and usage.
     * @type {Pointer<PWSTR>}
     */
    pszDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> value that names another known folder to serve as the parent folder. Applies to common and per-user folders only. This value is used in conjunction with <b>pszRelativePath</b>. See <b>Remarks</b> for more details.
     *                         
     *                         
     * 
     * This value is optional if no value is provided for <b>pszRelativePath</b>.
     * @type {Pointer<Guid>}
     */
    fidParent {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to a path relative to the parent folder specified in <b>fidParent</b>. This is a null-terminated Unicode string, refers to the physical file system path, and is not localized. Applies to common and per-user folders only. See <b>Remarks</b> for more details.
     * @type {Pointer<PWSTR>}
     */
    pszRelativePath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the Shell namespace folder path of the folder, stored as a null-terminated Unicode string. Applies to virtual folders only. For example, <c>Control Panel</code> has a parsing name of <code>::%CLSID_MyComputer%\::%CLSID_ControlPanel%</c>.
     * @type {Pointer<PWSTR>}
     */
    pszParsingName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

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
     * @type {Pointer<PWSTR>}
     */
    pszTooltip {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

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
     * @type {Pointer<PWSTR>}
     */
    pszLocalizedName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

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
     * @type {Pointer<PWSTR>}
     */
    pszIcon {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-definition-language">Security Descriptor Definition Language</a> format string. This is a null-terminated Unicode string that describes the default security descriptor that the folder receives when it is created. If this parameter is <b>NULL</b>, the new folder inherits the security descriptor of its parent. This is particularly useful for common folders that are accessed by all users.
     * @type {Pointer<PWSTR>}
     */
    pszSecurity {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Optional. Default file system attributes given to the folder when it is created. For example, the file could be hidden and read-only (FILE_ATTRIBUTE_HIDDEN and FILE_ATTRIBUTE_READONLY). For a complete list of possible values, see the <i>dwFlagsAndAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. Set to -1 if not needed.
     * @type {Integer}
     */
    dwAttributes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags">KF_DEFINITION_FLAGS</a></b>
     * 
     * Optional. One of more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags">KF_DEFINITION_FLAGS</a> enumeration that allow you to restrict redirection, allow PC-to-PC roaming, and control the time at which the known folder is created. Set to 0 if not needed.
     * @type {Integer}
     */
    kfdFlags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> values that identifies the known folder type based on its contents (such as documents, music, or photographs). This value is a GUID.
     * @type {Pointer<Guid>}
     */
    ftidType {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
