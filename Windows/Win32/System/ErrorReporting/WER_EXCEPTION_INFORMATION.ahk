#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains exception information for the WerReportAddDump function.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/ns-werapi-wer_exception_information
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_EXCEPTION_INFORMATION {
    #StructPack 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure.
     */
    pExceptionPointers : EXCEPTION_POINTERS.Ptr

    /**
     * A process (calling process) can provide error reporting functionality for another process (client process). If this member is <b>TRUE</b>, the exception pointer is located inside the  address space of the client process. If this member is <b>FALSE</b>, the exception pointer is located inside the address space of the calling process.
     */
    bClientPointers : BOOL

}
