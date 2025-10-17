#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the exception information written to the minidump file by the MiniDumpWriteDump function.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_exception_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_EXCEPTION_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The identifier of the thread throwing the exception.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure specifying a computer-independent description of the exception and the processor context at the time of the exception.
     * @type {Pointer<EXCEPTION_POINTERS>}
     */
    ExceptionPointers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Determines where to get the memory regions pointed to by the <b>ExceptionPointers</b> member. Set to <b>TRUE</b> if the memory resides in the process being debugged (the target process of the debugger). Otherwise, set to <b>FALSE</b> if the memory resides in the address space of the calling program (the debugger process). If you are accessing local memory (in the calling process) you should not set this member to <b>TRUE</b>.
     * @type {BOOL}
     */
    ClientPointers {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
