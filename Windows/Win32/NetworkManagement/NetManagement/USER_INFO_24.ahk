#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSID.ahk" { PSID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains user account information on an account which is connected to an Internet identity. This information includes the Internet provider name for the user, the user's Internet name, and the user's security identifier (SID).
 * @remarks
 * A user's account for logging onto Windows can be connected to an Internet identity. The user account can be a local account on a computer or a domain account for computers joined to a domain. The <b>USER_INFO_24</b> structure is used to provide information on an account which is connected to an Internet identity.
 * 
 * On Windows 8 and Windows Server 2012, the Internet identity for a connected account can often be used instead of the computer account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_24
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_24 {
    #StructPack 8

    /**
     * A boolean value that indicates whether an account is connected to an Internet identity. 
     * 
     * This member is true if the account is connected  to an Internet identity. The other members in this structure can be used. 
     * 
     * If this member is false, then the account is not connected  to an Internet identity and other members in this structure should be ignored.
     */
    usri24_internet_identity : BOOL

    /**
     * A set of flags. This member must be zero.
     */
    usri24_flags : UInt32

    /**
     * A pointer to a Unicode string that specifies the Internet provider name.
     */
    usri24_internet_provider_name : PWSTR

    /**
     * A pointer to a Unicode string that specifies the user's Internet name.
     */
    usri24_internet_principal_name : PWSTR

    /**
     * The local account SID of the user.
     */
    usri24_user_sid : PSID

}
