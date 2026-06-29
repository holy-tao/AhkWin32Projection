#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_EXCEPTION_PORT {
    #StructPack 8

    ExceptionPortHandle : HANDLE

    StateFlags : UInt32

}
