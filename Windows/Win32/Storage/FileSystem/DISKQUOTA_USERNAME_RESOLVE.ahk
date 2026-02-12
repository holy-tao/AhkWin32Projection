#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/dskquota/nf-dskquota-idiskquotacontrol-addusername">IDiskQuotaControl.AddUserName</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/dskquota/nf-dskquota-idiskquotacontrol-addusersid">IDiskQuotaControl.AddUserSid</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/dskquota/nf-dskquota-idiskquotacontrol-createenumusers">IDiskQuotaControl.CreateEnumUsers</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/dskquota/nf-dskquota-idiskquotacontrol-findusersid">IDiskQuotaControl.FindUserSid</see>.
 * @see 
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DISKQUOTA_USERNAME_RESOLVE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_SYNC => 1
}
