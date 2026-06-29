#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\PSID.ahk" { PSID }

/**
 * The LSA_ENUMERATION_INFORMATION structure is used with the LsaEnumerateAccountsWithUserRight function to return a pointer to a SID.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_enumeration_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_ENUMERATION_INFORMATION {
    #StructPack 8

    /**
     * Pointer to a SID.
     */
    Sid : PSID

}
