#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct EXCEPTION_RECORD32 {
    #StructPack 4

    ExceptionCode : NTSTATUS

    ExceptionFlags : UInt32

    ExceptionRecord : UInt32

    ExceptionAddress : UInt32

    NumberParameters : UInt32

    ExceptionInformation : UInt32[15]

}
