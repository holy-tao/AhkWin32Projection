#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains exception information for the WerReportAddDump function.
 * @see https://docs.microsoft.com/windows/win32/api//werapi/ns-werapi-wer_exception_information
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_EXCEPTION_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure.
     * @type {Pointer<EXCEPTION_POINTERS>}
     */
    pExceptionPointers {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A process (calling process) can provide error reporting functionality for another process (client process). If this member is <b>TRUE</b>, the exception pointer is located inside the  address space of the client process. If this member is <b>FALSE</b>, the exception pointer is located inside the address space of the calling process.
     * @type {BOOL}
     */
    bClientPointers {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
