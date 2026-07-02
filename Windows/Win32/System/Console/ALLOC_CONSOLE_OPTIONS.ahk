#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALLOC_CONSOLE_MODE.ahk" { ALLOC_CONSOLE_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct ALLOC_CONSOLE_OPTIONS {
    #StructPack 4

    mode : ALLOC_CONSOLE_MODE

    useShowWindow : BOOL

    showWindow : UInt16

}
