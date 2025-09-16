#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains user account information on an account which is connected to an Internet identity. This information includes the Internet provider name for the user, the user's Internet name, and the user's security identifier (SID).
 * @remarks
 * A user's account for logging onto Windows can be connected to an Internet identity. The user account can be a local account on a computer or a domain account for computers joined to a domain. The <b>USER_INFO_24</b> structure is used to provide information on an account which is connected to an Internet identity.
  * 
  * On Windows 8 and Windows Server 2012, the Internet identity for a connected account can often be used instead of the computer account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_24
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_24 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A boolean value that indicates whether an account is connected to an Internet identity. 
     * 
     * This member is true if the account is connected  to an Internet identity. The other members in this structure can be used. 
     * 
     * If this member is false, then the account is not connected  to an Internet identity and other members in this structure should be ignored.
     * @type {Integer}
     */
    usri24_internet_identity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A set of flags. This member must be zero.
     * @type {Integer}
     */
    usri24_flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a Unicode string that specifies the Internet provider name.
     * @type {Pointer<PWSTR>}
     */
    usri24_internet_provider_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a Unicode string that specifies the user's Internet name.
     * @type {Pointer<PWSTR>}
     */
    usri24_internet_principal_name {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The local account SID of the user.
     * @type {Pointer<PSID>}
     */
    usri24_user_sid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
