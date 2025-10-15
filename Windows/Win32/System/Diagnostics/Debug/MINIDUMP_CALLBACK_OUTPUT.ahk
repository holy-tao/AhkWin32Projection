#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\MINIDUMP_MEMORY_INFO.ahk

/**
 * Contains information returned by the MiniDumpCallback function.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_callback_output
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_CALLBACK_OUTPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

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
     * @type {BOOL}
     */
    CheckCancel{
        get {
            if(!this.HasProp("__CheckCancel"))
                this.__CheckCancel := BOOL(this.ptr + 0)
            return this.__CheckCancel
        }
    }

    /**
     * @type {BOOL}
     */
    Cancel{
        get {
            if(!this.HasProp("__Cancel"))
                this.__Cancel := BOOL(this.ptr + 4)
            return this.__Cancel
        }
    }

    /**
     * @type {HANDLE}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(this.ptr + 0)
            return this.__Handle
        }
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
     * @type {BOOL}
     */
    Continue{
        get {
            if(!this.HasProp("__Continue"))
                this.__Continue := BOOL(this.ptr + 48)
            return this.__Continue
        }
    }

    /**
     * @type {HRESULT}
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
     * @type {HRESULT}
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
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
