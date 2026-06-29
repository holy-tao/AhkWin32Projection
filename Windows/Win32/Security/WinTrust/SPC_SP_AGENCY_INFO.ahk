#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPC_LINK.ahk" { SPC_LINK }
#Import ".\SPC_IMAGE.ahk" { SPC_IMAGE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_SP_AGENCY_INFO {
    #StructPack 8

    pPolicyInformation : SPC_LINK.Ptr

    pwszPolicyDisplayText : PWSTR

    pLogoImage : SPC_IMAGE.Ptr

    pLogoLink : SPC_LINK.Ptr

}
