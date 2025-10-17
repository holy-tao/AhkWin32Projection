#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PROCESSTRACE_HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_BUFFER_CALLBACK_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
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
     * @type {Pointer<TRACE_LOGFILE_HEADER>}
     */
    LogfileHeader {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BuffersRead {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
