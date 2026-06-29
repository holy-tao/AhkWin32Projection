#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_SELECTOR_SET.ahk" { WSMAN_SELECTOR_SET }
#Import ".\WSMAN_KEY.ahk" { WSMAN_KEY }
#Import ".\WSMAN_OPTION.ahk" { WSMAN_OPTION }
#Import ".\WSMAN_FILTER.ahk" { WSMAN_FILTER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_FRAGMENT.ahk" { WSMAN_FRAGMENT }
#Import ".\WSMAN_OPTION_SETEX.ahk" { WSMAN_OPTION_SETEX }

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_OPERATION_INFOEX {
    #StructPack 8

    fragment : WSMAN_FRAGMENT

    filter : WSMAN_FILTER

    selectorSet : WSMAN_SELECTOR_SET

    optionSet : WSMAN_OPTION_SETEX

    version : UInt32

    uiLocale : PWSTR

    dataLocale : PWSTR

}
