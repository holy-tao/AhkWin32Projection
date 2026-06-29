#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSID.ahk" { PSID }

/**
 * Specifies all the information in a token that is necessary for an app container.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_appcontainer_information
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_APPCONTAINER_INFORMATION {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the app container.
     */
    TokenAppContainer : PSID

}
