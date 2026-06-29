#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.UpdateAssessment
 */
export default struct CloudCampaignAssessment {
    #StructPack 8

    name : PWSTR

    tool : PWSTR

}
