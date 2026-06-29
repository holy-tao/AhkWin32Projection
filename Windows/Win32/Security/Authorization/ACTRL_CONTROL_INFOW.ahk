#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authorization
 * @charset Unicode
 */
export default struct ACTRL_CONTROL_INFOW {
    #StructPack 8

    lpControlId : PWSTR

    lpControlName : PWSTR

}
