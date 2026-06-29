#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ACTIVATION_CONTEXT_BASIC_INFORMATION {
    #StructPack 8

    hActCtx : HANDLE

    dwFlags : UInt32

}
