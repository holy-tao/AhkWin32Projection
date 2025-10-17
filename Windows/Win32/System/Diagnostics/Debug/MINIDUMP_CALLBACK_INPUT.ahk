#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\ARM64_NT_NEON128.ahk
#Include .\CONTEXT.ahk
#Include .\MINIDUMP_THREAD_CALLBACK.ahk
#Include .\MINIDUMP_THREAD_EX_CALLBACK.ahk
#Include ..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk
#Include .\MINIDUMP_MODULE_CALLBACK.ahk
#Include .\MINIDUMP_INCLUDE_THREAD_CALLBACK.ahk
#Include .\MINIDUMP_INCLUDE_MODULE_CALLBACK.ahk
#Include .\MINIDUMP_IO_CALLBACK.ahk
#Include .\MINIDUMP_READ_MEMORY_FAILURE_CALLBACK.ahk
#Include .\MINIDUMP_VM_QUERY_CALLBACK.ahk
#Include .\MINIDUMP_VM_PRE_READ_CALLBACK.ahk
#Include .\MINIDUMP_VM_POST_READ_CALLBACK.ahk

/**
 * Contains information used by the MiniDumpCallback function.
 * @remarks
 * 
  * If <b>CallbackType</b> is <b>CancelCallback</b> or <b>MemoryCallback</b>, the <b>ProcessId</b>, <b>ProcessHandle</b>, and <b>CallbackType</b> members are valid but no other input is specified.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_callback_input
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_CALLBACK_INPUT extends Win32Struct
{
    static sizeof => 736

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
     * @type {HANDLE}
     */
    ProcessHandle{
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(8, this)
            return this.__ProcessHandle
        }
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
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {MINIDUMP_THREAD_CALLBACK}
     */
    Thread{
        get {
            if(!this.HasProp("__Thread"))
                this.__Thread := MINIDUMP_THREAD_CALLBACK(24, this)
            return this.__Thread
        }
    }

    /**
     * @type {MINIDUMP_THREAD_EX_CALLBACK}
     */
    ThreadEx{
        get {
            if(!this.HasProp("__ThreadEx"))
                this.__ThreadEx := MINIDUMP_THREAD_EX_CALLBACK(24, this)
            return this.__ThreadEx
        }
    }

    /**
     * @type {MINIDUMP_MODULE_CALLBACK}
     */
    Module{
        get {
            if(!this.HasProp("__Module"))
                this.__Module := MINIDUMP_MODULE_CALLBACK(24, this)
            return this.__Module
        }
    }

    /**
     * @type {MINIDUMP_INCLUDE_THREAD_CALLBACK}
     */
    IncludeThread{
        get {
            if(!this.HasProp("__IncludeThread"))
                this.__IncludeThread := MINIDUMP_INCLUDE_THREAD_CALLBACK(24, this)
            return this.__IncludeThread
        }
    }

    /**
     * @type {MINIDUMP_INCLUDE_MODULE_CALLBACK}
     */
    IncludeModule{
        get {
            if(!this.HasProp("__IncludeModule"))
                this.__IncludeModule := MINIDUMP_INCLUDE_MODULE_CALLBACK(24, this)
            return this.__IncludeModule
        }
    }

    /**
     * @type {MINIDUMP_IO_CALLBACK}
     */
    Io{
        get {
            if(!this.HasProp("__Io"))
                this.__Io := MINIDUMP_IO_CALLBACK(24, this)
            return this.__Io
        }
    }

    /**
     * @type {MINIDUMP_READ_MEMORY_FAILURE_CALLBACK}
     */
    ReadMemoryFailure{
        get {
            if(!this.HasProp("__ReadMemoryFailure"))
                this.__ReadMemoryFailure := MINIDUMP_READ_MEMORY_FAILURE_CALLBACK(24, this)
            return this.__ReadMemoryFailure
        }
    }

    /**
     * @type {Integer}
     */
    SecondaryFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {MINIDUMP_VM_QUERY_CALLBACK}
     */
    VmQuery{
        get {
            if(!this.HasProp("__VmQuery"))
                this.__VmQuery := MINIDUMP_VM_QUERY_CALLBACK(24, this)
            return this.__VmQuery
        }
    }

    /**
     * @type {MINIDUMP_VM_PRE_READ_CALLBACK}
     */
    VmPreRead{
        get {
            if(!this.HasProp("__VmPreRead"))
                this.__VmPreRead := MINIDUMP_VM_PRE_READ_CALLBACK(24, this)
            return this.__VmPreRead
        }
    }

    /**
     * @type {MINIDUMP_VM_POST_READ_CALLBACK}
     */
    VmPostRead{
        get {
            if(!this.HasProp("__VmPostRead"))
                this.__VmPostRead := MINIDUMP_VM_POST_READ_CALLBACK(24, this)
            return this.__VmPostRead
        }
    }
}
