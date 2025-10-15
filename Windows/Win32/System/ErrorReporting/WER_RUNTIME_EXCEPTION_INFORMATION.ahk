#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\NTSTATUS.ahk
#Include ..\Diagnostics\Debug\EXCEPTION_RECORD.ahk
#Include ..\Diagnostics\Debug\ARM64_NT_NEON128.ahk
#Include ..\Diagnostics\Debug\CONTEXT.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the exception information that you use to determine whether you want to claim the crash.
 * @see https://docs.microsoft.com/windows/win32/api//werapi/ns-werapi-wer_runtime_exception_information
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_RUNTIME_EXCEPTION_INFORMATION extends Win32Struct
{
    static sizeof => 848

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The handle to the process that crashed.
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 8)
            return this.__hProcess
        }
    }

    /**
     * The handle to the thread that crashed.
     * @type {HANDLE}
     */
    hThread{
        get {
            if(!this.HasProp("__hThread"))
                this.__hThread := HANDLE(this.ptr + 16)
            return this.__hThread
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure that contains the exception information.
     * @type {EXCEPTION_RECORD}
     */
    exceptionRecord{
        get {
            if(!this.HasProp("__exceptionRecord"))
                this.__exceptionRecord := EXCEPTION_RECORD(this.ptr + 24)
            return this.__exceptionRecord
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the context information.
     * @type {CONTEXT}
     */
    context{
        get {
            if(!this.HasProp("__context"))
                this.__context := CONTEXT(this.ptr + 176)
            return this.__context
        }
    }

    /**
     * A pointer to a constant, null-terminated string that contains the size of the exception information.
     * @type {PWSTR}
     */
    pwszReportId{
        get {
            if(!this.HasProp("__pwszReportId"))
                this.__pwszReportId := PWSTR(this.ptr + 832)
            return this.__pwszReportId
        }
    }

    /**
     * @type {BOOL}
     */
    bIsFatal{
        get {
            if(!this.HasProp("__bIsFatal"))
                this.__bIsFatal := BOOL(this.ptr + 840)
            return this.__bIsFatal
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 844, "uint")
        set => NumPut("uint", value, this, 844)
    }
}
