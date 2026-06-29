#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the exception information written to the minidump file by the MiniDumpWriteDump function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct MINIDUMP_EXCEPTION_INFORMATION {
    #StructPack 8

    /**
     * The identifier of the thread throwing the exception.
     */
    ThreadId : UInt32

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure specifying a computer-independent description of the exception and the processor context at the time of the exception.
     */
    ExceptionPointers : EXCEPTION_POINTERS.Ptr

    /**
     * Determines where to get the memory regions pointed to by the <b>ExceptionPointers</b> member. Set to <b>TRUE</b> if the memory resides in the process being debugged (the target process of the debugger). Otherwise, set to <b>FALSE</b> if the memory resides in the address space of the calling program (the debugger process). If you are accessing local memory (in the calling process) you should not set this member to <b>TRUE</b>.
     */
    ClientPointers : BOOL

}
