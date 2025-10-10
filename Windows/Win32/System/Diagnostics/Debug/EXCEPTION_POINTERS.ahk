#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains an exception record with a machine-independent description of an exception and a context record with a machine-dependent description of the processor context at the time of the exception.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-exception_pointers
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EXCEPTION_POINTERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure that contains a machine-independent description of the exception.
     * @type {Pointer<EXCEPTION_RECORD>}
     */
    ExceptionRecord {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains a processor-specific description of the state of the processor at the time of the exception.
     * @type {Pointer<CONTEXT>}
     */
    ContextRecord {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
