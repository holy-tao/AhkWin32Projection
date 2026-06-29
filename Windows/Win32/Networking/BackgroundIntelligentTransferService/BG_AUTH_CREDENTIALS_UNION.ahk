#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BG_BASIC_CREDENTIALS.ahk" { BG_BASIC_CREDENTIALS }

/**
 * Identifies the credentials to use for the authentication scheme specified in the BG_AUTH_CREDENTIALS structure.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ns-bits1_5-bg_auth_credentials_union
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_AUTH_CREDENTIALS_UNION {
    #StructPack 8

    /**
     * Identifies the user name and password of the user to authenticate. For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
     */
    Basic : BG_BASIC_CREDENTIALS

}
