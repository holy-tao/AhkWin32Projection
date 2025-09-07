#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_EXCEPTION.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk

/**
 * Represents an exception information stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_EXCEPTION_STREAM extends Win32Struct
{
    static sizeof => 168

    static packingSize => 4

    /**
     * The identifier of the thread that caused the exception.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A variable for alignment.
     * @type {Integer}
     */
    __alignment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_exception">MINIDUMP_EXCEPTION</a> structure.
     * @type {MINIDUMP_EXCEPTION}
     */
    ExceptionRecord{
        get {
            if(!this.HasProp("__ExceptionRecord"))
                this.__ExceptionRecord := MINIDUMP_EXCEPTION(this.ptr + 8)
            return this.__ExceptionRecord
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    ThreadContext{
        get {
            if(!this.HasProp("__ThreadContext"))
                this.__ThreadContext := MINIDUMP_LOCATION_DESCRIPTOR(this.ptr + 160)
            return this.__ThreadContext
        }
    }
}
