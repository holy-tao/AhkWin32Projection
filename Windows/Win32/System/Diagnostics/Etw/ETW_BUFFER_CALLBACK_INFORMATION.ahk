#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PROCESSTRACE_HANDLE.ahk

/**
 * Provided to the BufferCallback as the *ConsumerInfo* parameter and provides details on the current processing session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_buffer_callback_information
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_BUFFER_CALLBACK_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The TraceHandle for this processing session.
     * @type {PROCESSTRACE_HANDLE}
     */
    TraceHandle{
        get {
            if(!this.HasProp("__TraceHandle"))
                this.__TraceHandle := PROCESSTRACE_HANDLE(0, this)
            return this.__TraceHandle
        }
    }

    /**
     * [TRACE_LOGFILE_HEADER](ns-evntrace-trace_logfile_header.md) structure containing trace processing status (previously-existing structure).
     * @type {Pointer<TRACE_LOGFILE_HEADER>}
     */
    LogfileHeader {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The count of how many buffers have been processed up to this point.
     * @type {Integer}
     */
    BuffersRead {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
