#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_FINANCIAL_CRITERIA {
    #StructPack 4

    fFinancialInfoAvailable : BOOL

    fMeetsCriteria : BOOL

}
