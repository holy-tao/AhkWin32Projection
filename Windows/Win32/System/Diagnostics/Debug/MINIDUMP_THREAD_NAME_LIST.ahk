#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_THREAD_NAME.ahk" { MINIDUMP_THREAD_NAME }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_NAME_LIST {
    #StructPack 8

    NumberOfThreadNames : UInt32

    ThreadNames : MINIDUMP_THREAD_NAME[1]

}
