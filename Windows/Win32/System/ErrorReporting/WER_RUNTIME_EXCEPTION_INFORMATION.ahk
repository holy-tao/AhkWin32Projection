#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\CONTEXT.ahk" { CONTEXT }
#Import "..\Diagnostics\Debug\EXCEPTION_RECORD.ahk" { EXCEPTION_RECORD }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\Diagnostics\Debug\ARM64_NT_NEON128.ahk" { ARM64_NT_NEON128 }
#Import "..\Diagnostics\Debug\CONTEXT_FLAGS.ahk" { CONTEXT_FLAGS }

/**
 * Contains the exception information that you use to determine whether you want to claim the crash.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/ns-werapi-wer_runtime_exception_information
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_RUNTIME_EXCEPTION_INFORMATION {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * The handle to the process that crashed.
     */
    hProcess : HANDLE

    /**
     * The handle to the thread that crashed.
     */
    hThread : HANDLE

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure that contains the exception information.
     */
    exceptionRecord : EXCEPTION_RECORD

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the context information.
     */
    context : CONTEXT

    /**
     * A pointer to a constant, null-terminated string that contains the size of the exception information.
     */
    pwszReportId : PWSTR

    bIsFatal : BOOL

    dwReserved : UInt32

}
