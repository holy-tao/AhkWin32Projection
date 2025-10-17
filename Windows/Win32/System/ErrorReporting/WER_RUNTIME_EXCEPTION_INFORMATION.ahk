#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\Diagnostics\Debug\EXCEPTION_RECORD.ahk
#Include ..\Diagnostics\Debug\ARM64_NT_NEON128.ahk
#Include ..\Diagnostics\Debug\CONTEXT.ahk

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
                this.__hProcess := HANDLE(8, this)
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
                this.__hThread := HANDLE(16, this)
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
                this.__exceptionRecord := EXCEPTION_RECORD(24, this)
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
                this.__context := CONTEXT(176, this)
            return this.__context
        }
    }

    /**
     * A pointer to a constant, null-terminated string that contains the size of the exception information.
     * @type {PWSTR}
     */
    pwszReportId {
        get => NumGet(this, 832, "ptr")
        set => NumPut("ptr", value, this, 832)
    }

    /**
     * @type {BOOL}
     */
    bIsFatal {
        get => NumGet(this, 840, "int")
        set => NumPut("int", value, this, 840)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 844, "uint")
        set => NumPut("uint", value, this, 844)
    }
}
