#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_MEMORY_INFO.ahk

/**
 * Contains information returned by the MiniDumpCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_CALLBACK_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ModuleWriteFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ThreadWriteFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SecondaryFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MemoryBase {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MemorySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CheckCancel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Cancel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {MINIDUMP_MEMORY_INFO}
     */
    VmRegion{
        get {
            if(!this.HasProp("__VmRegion"))
                this.__VmRegion := MINIDUMP_MEMORY_INFO(this.ptr + 0)
            return this.__VmRegion
        }
    }

    /**
     * @type {Integer}
     */
    Continue {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    VmQueryStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MINIDUMP_MEMORY_INFO}
     */
    VmQueryResult{
        get {
            if(!this.HasProp("__VmQueryResult"))
                this.__VmQueryResult := MINIDUMP_MEMORY_INFO(this.ptr + 8)
            return this.__VmQueryResult
        }
    }

    /**
     * @type {Integer}
     */
    VmReadStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VmReadBytesCompleted {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
