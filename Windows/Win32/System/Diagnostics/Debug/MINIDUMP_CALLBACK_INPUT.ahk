#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ARM64_NT_NEON128.ahk
#Include .\CONTEXT.ahk
#Include .\MINIDUMP_THREAD_CALLBACK.ahk
#Include .\MINIDUMP_THREAD_EX_CALLBACK.ahk
#Include ..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk
#Include .\MINIDUMP_MODULE_CALLBACK.ahk
#Include .\MINIDUMP_IO_CALLBACK.ahk
#Include .\MINIDUMP_READ_MEMORY_FAILURE_CALLBACK.ahk
#Include .\MINIDUMP_VM_PRE_READ_CALLBACK.ahk
#Include .\MINIDUMP_VM_POST_READ_CALLBACK.ahk

/**
 * Contains information used by the MiniDumpCallback function.
 * @remarks
 * If <b>CallbackType</b> is <b>CancelCallback</b> or <b>MemoryCallback</b>, the <b>ProcessId</b>, <b>ProcessHandle</b>, and <b>CallbackType</b> members are valid but no other input is specified.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_input
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_CALLBACK_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The identifier of the process that contains callback function.
     * 
     * This member is not used if <b>CallbackType</b> is <b>IoStartCallback</b>.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the process that contains the callback function.
     * 
     * This member is not used if <b>CallbackType</b> is <b>IoStartCallback</b>.
     * @type {Pointer<HANDLE>}
     */
    ProcessHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The type of callback function. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_callback_type">MINIDUMP_CALLBACK_TYPE</a> enumeration.
     * @type {Integer}
     */
    CallbackType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {MINIDUMP_THREAD_CALLBACK}
     */
    Thread{
        get {
            if(!this.HasProp("__Thread"))
                this.__Thread := MINIDUMP_THREAD_CALLBACK(this.ptr + 20)
            return this.__Thread
        }
    }

    /**
     * @type {MINIDUMP_THREAD_EX_CALLBACK}
     */
    ThreadEx{
        get {
            if(!this.HasProp("__ThreadEx"))
                this.__ThreadEx := MINIDUMP_THREAD_EX_CALLBACK(this.ptr + 20)
            return this.__ThreadEx
        }
    }

    /**
     * @type {MINIDUMP_MODULE_CALLBACK}
     */
    Module{
        get {
            if(!this.HasProp("__Module"))
                this.__Module := MINIDUMP_MODULE_CALLBACK(this.ptr + 20)
            return this.__Module
        }
    }

    /**
     * @type {Integer}
     */
    IncludeThread {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    IncludeModule {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {MINIDUMP_IO_CALLBACK}
     */
    Io{
        get {
            if(!this.HasProp("__Io"))
                this.__Io := MINIDUMP_IO_CALLBACK(this.ptr + 20)
            return this.__Io
        }
    }

    /**
     * @type {MINIDUMP_READ_MEMORY_FAILURE_CALLBACK}
     */
    ReadMemoryFailure{
        get {
            if(!this.HasProp("__ReadMemoryFailure"))
                this.__ReadMemoryFailure := MINIDUMP_READ_MEMORY_FAILURE_CALLBACK(this.ptr + 20)
            return this.__ReadMemoryFailure
        }
    }

    /**
     * @type {Integer}
     */
    SecondaryFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    VmQuery {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {MINIDUMP_VM_PRE_READ_CALLBACK}
     */
    VmPreRead{
        get {
            if(!this.HasProp("__VmPreRead"))
                this.__VmPreRead := MINIDUMP_VM_PRE_READ_CALLBACK(this.ptr + 20)
            return this.__VmPreRead
        }
    }

    /**
     * @type {MINIDUMP_VM_POST_READ_CALLBACK}
     */
    VmPostRead{
        get {
            if(!this.HasProp("__VmPostRead"))
                this.__VmPostRead := MINIDUMP_VM_POST_READ_CALLBACK(this.ptr + 20)
            return this.__VmPostRead
        }
    }
}
