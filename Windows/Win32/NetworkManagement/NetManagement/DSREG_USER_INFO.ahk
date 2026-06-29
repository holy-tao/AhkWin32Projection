#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a user account that is used to join a device to Microsoft Azure Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ns-lmjoin-dsreg_user_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct DSREG_USER_INFO {
    #StructPack 8

    /**
     * The email address of the user.
     */
    pszUserEmail : PWSTR

    /**
     * The identifier of the Microsoft Passport key that is provisioned for the user.
     */
    pszUserKeyId : PWSTR

    /**
     * The name of the Microsoft Passport key that is provisioned for the user.
     */
    pszUserKeyName : PWSTR

}
