#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Security\PSID.ahk

/**
 * Contains user account information on an account which is connected to an Internet identity. This information includes the Internet provider name for the user, the user's Internet name, and the user's security identifier (SID).
 * @remarks
 * 
  * A user's account for logging onto Windows can be connected to an Internet identity. The user account can be a local account on a computer or a domain account for computers joined to a domain. The <b>USER_INFO_24</b> structure is used to provide information on an account which is connected to an Internet identity.
  * 
  * On Windows 8 and Windows Server 2012, the Internet identity for a connected account can often be used instead of the computer account.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_24
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
     * @type {BOOL}
     */
    usri24_internet_identity{
        get {
            if(!this.HasProp("__usri24_internet_identity"))
                this.__usri24_internet_identity := BOOL(this.ptr + 0)
            return this.__usri24_internet_identity
        }
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
     * @type {PWSTR}
     */
    usri24_internet_provider_name{
        get {
            if(!this.HasProp("__usri24_internet_provider_name"))
                this.__usri24_internet_provider_name := PWSTR(this.ptr + 8)
            return this.__usri24_internet_provider_name
        }
    }

    /**
     * A pointer to a Unicode string that specifies the user's Internet name.
     * @type {PWSTR}
     */
    usri24_internet_principal_name{
        get {
            if(!this.HasProp("__usri24_internet_principal_name"))
                this.__usri24_internet_principal_name := PWSTR(this.ptr + 16)
            return this.__usri24_internet_principal_name
        }
    }

    /**
     * The local account SID of the user.
     * @type {PSID}
     */
    usri24_user_sid{
        get {
            if(!this.HasProp("__usri24_user_sid"))
                this.__usri24_user_sid := PSID(this.ptr + 24)
            return this.__usri24_user_sid
        }
    }
}
