#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the access permissions assigned to the Users or Public folder. Used in CreateShare and GetSharePermissions.
 * @remarks
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-createshare">ISharingConfigurationManager::CreateShare</a> accepts only <b>SHARE_ROLE_READER</b> and <b>SHARE_ROLE_CO_OWNER</b>. All other values are seen only in the results of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-getsharepermissions">ISharingConfigurationManager::GetSharePermissions</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-share_role
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHARE_ROLE{

    /**
     * The folder is not shared.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_INVALID => -1

    /**
     * The contents of the folder can be read, but not altered or added to.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_READER => 0

    /**
     * The contents of the folder can be read and altered. New items can be added, however items can be deleted only by the user that contributed them.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_CONTRIBUTOR => 1

    /**
     * The contents of the folder can be read, changed, or added to.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_CO_OWNER => 2

    /**
     * Not normally used in the context of this interface.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_OWNER => 3

    /**
     * The folder is shared, but the share role is neither SHARE_ROLE_READER, SHARE_ROLE_CONTRIBUTOR, or SHARE_ROLE_CO_OWNER.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_CUSTOM => 4

    /**
     * Not used in the context of this interface.
     * @type {Integer (Int32)}
     */
    static SHARE_ROLE_MIXED => 5
}
