#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1004 structure contains forced logoff information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_modals_info_1004
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1004 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies, in seconds, the amount of time between the end of the valid logon time and the time when the user is forced to log off the network. A value of TIMEQ_FOREVER indicates that the user is never forced to log off. A value of zero indicates that the user will be forced to log off immediately when the valid logon time expires.
     * @type {Integer}
     */
    usrmod1004_force_logoff {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
