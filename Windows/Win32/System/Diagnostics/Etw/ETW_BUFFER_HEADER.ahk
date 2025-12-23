#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk

/**
 * The header structure of an ETW buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_buffer_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_BUFFER_HEADER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * The time when the buffer was flushed. It will be in the raw clock type of the session from which the buffer was collected (for example, QueryPerformanceCounter, CPU timestamp counter, or GetSystemTimeAsFileTime).
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * Contains information about the processor and logger that generated this buffer. See [ETW_BUFFER_CONTEXT](ns-evntrace-etw_buffer_context.md).
     * @type {ETW_BUFFER_CONTEXT}
     */
    ClientContext{
        get {
            if(!this.HasProp("__ClientContext"))
                this.__ClientContext := ETW_BUFFER_CONTEXT(40, this)
            return this.__ClientContext
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The size of the valid data in the buffer. This is the size of the ETW_BUFFER_HEADER and the event data. When a buffer is copied, it is common to only allocate enough memory to store the valid data (for example, only FilledBytes bytes are allocated and copied), so recipients of a buffer should not read beyond this offset
     * @type {Integer}
     */
    FilledBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 52, 5, Primitive, "uint")
            return this.__Reserved4ProxyArray
        }
    }
}
