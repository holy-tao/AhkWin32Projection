#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }
#Import "..\..\PSID.ahk" { PSID }

/**
 * The SecurityUserData structure contains information about the user of a security support provider/authentication package. This structure is used by the SpGetUserInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-security_user_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECURITY_USER_DATA {
    #StructPack 8

    /**
     * The name of the user.
     */
    UserName : SECURITY_STRING

    /**
     * The domain the user is logged onto.
     */
    LogonDomainName : SECURITY_STRING

    /**
     * The name of the server that logged the user on.
     */
    LogonServer : SECURITY_STRING

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user.
     */
    pSid : PSID

}
