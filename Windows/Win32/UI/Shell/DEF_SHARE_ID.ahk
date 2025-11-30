#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that specify the folder being acted on by methods of the ISharingConfigurationManager interface.
 * @remarks
 * 
 * In Windows Vista, an Server Message Block (SMB) share is created for both the <b>Users</b> and <b>Public</b> folders. As of Windows 7, the Public share is accessed through the Users share, so only <b>Users</b> is given an SMB share.
 * 
 * When methods are called with the <b>DEFSHAREID_PUBLIC</b> value, the restrictions specified by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a> value in that call apply to the <i>Everyone</i> access control entry (ACE).
 * 
 * When methods are called with the <b>DEFSHAREID_USERS</b> value, the restrictions specified by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a> value in that call apply to the <i>Authenticated Users</i> ACE.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-def_share_id
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DEF_SHARE_ID extends Win32Enum{

    /**
     * The <b>Users</b> folder (<a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_UserProfiles</a>). This folder is usually found at C:\Users.
     * @type {Integer (Int32)}
     */
    static DEFSHAREID_USERS => 1

    /**
     * The <b>Public</b> folder (<a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_Public</a>). This folder is usually found at C:\Users\Public.
     * @type {Integer (Int32)}
     */
    static DEFSHAREID_PUBLIC => 2
}
