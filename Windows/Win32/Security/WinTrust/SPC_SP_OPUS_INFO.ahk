#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPC_LINK.ahk" { SPC_LINK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_SP_OPUS_INFO {
    #StructPack 8

    pwszProgramName : PWSTR

    pMoreInfo : SPC_LINK.Ptr

    pPublisherInfo : SPC_LINK.Ptr

}
