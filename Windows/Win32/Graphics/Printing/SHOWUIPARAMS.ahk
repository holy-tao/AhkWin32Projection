#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MESSAGEBOX_PARAMS.ahk" { MESSAGEBOX_PARAMS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UI_TYPE.ahk" { UI_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct SHOWUIPARAMS {
    #StructPack 8

    UIType : UI_TYPE

    MessageBoxParams : MESSAGEBOX_PARAMS

}
