#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_DUMP_CUSTOM_OPTIONS_V2 {
    #StructPack 4

    dwSize : UInt32

    dwMask : UInt32

    dwDumpFlags : UInt32

    bOnlyThisThread : BOOL

    dwExceptionThreadFlags : UInt32

    dwOtherThreadFlags : UInt32

    dwExceptionThreadExFlags : UInt32

    dwOtherThreadExFlags : UInt32

    dwPreferredModuleFlags : UInt32

    dwOtherModuleFlags : UInt32

    wzPreferredModuleList : WCHAR[256]

    dwPreferredModuleResetFlags : UInt32

    dwOtherModuleResetFlags : UInt32

}
