#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about the SIM that is used by the EAP method for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapsimcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapSimCredential {
    #StructPack 8

    /**
     * A NULL-terminated Unicode string that contains the ICC-ID of the SIM.
     */
    iccID : PWSTR

}
