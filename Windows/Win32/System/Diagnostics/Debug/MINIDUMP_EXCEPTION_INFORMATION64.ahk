#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_EXCEPTION_INFORMATION64 {
    #StructPack 8

    ThreadId : UInt32

    ExceptionRecord : Int64

    ContextRecord : Int64

    ClientPointers : BOOL

}
