#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_OPTION.ahk" { WSMAN_OPTION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_OPTION_SETEX {
    #StructPack 8

    optionsCount : UInt32

    options : WSMAN_OPTION.Ptr

    optionsMustUnderstand : BOOL

    optionTypes : PWSTR.Ptr

}
