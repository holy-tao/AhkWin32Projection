#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CONTEXT.ahk" { CONTEXT }
#Import ".\MINIDUMP_INCLUDE_THREAD_CALLBACK.ahk" { MINIDUMP_INCLUDE_THREAD_CALLBACK }
#Import ".\MINIDUMP_IO_CALLBACK.ahk" { MINIDUMP_IO_CALLBACK }
#Import ".\MINIDUMP_THREAD_EX_CALLBACK.ahk" { MINIDUMP_THREAD_EX_CALLBACK }
#Import ".\MINIDUMP_READ_MEMORY_FAILURE_CALLBACK.ahk" { MINIDUMP_READ_MEMORY_FAILURE_CALLBACK }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_OS.ahk" { VS_FIXEDFILEINFO_FILE_OS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_FLAGS.ahk" { VS_FIXEDFILEINFO_FILE_FLAGS }
#Import ".\MINIDUMP_VM_QUERY_CALLBACK.ahk" { MINIDUMP_VM_QUERY_CALLBACK }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk" { VS_FIXEDFILEINFO }
#Import ".\MINIDUMP_VM_PRE_READ_CALLBACK.ahk" { MINIDUMP_VM_PRE_READ_CALLBACK }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MINIDUMP_INCLUDE_MODULE_CALLBACK.ahk" { MINIDUMP_INCLUDE_MODULE_CALLBACK }
#Import ".\MINIDUMP_THREAD_CALLBACK.ahk" { MINIDUMP_THREAD_CALLBACK }
#Import ".\ARM64_NT_NEON128.ahk" { ARM64_NT_NEON128 }
#Import ".\CONTEXT_FLAGS.ahk" { CONTEXT_FLAGS }
#Import ".\MINIDUMP_VM_POST_READ_CALLBACK.ahk" { MINIDUMP_VM_POST_READ_CALLBACK }
#Import ".\MINIDUMP_MODULE_CALLBACK.ahk" { MINIDUMP_MODULE_CALLBACK }

/**
 * Contains information used by the MiniDumpCallback function.
 * @remarks
 * If <b>CallbackType</b> is <b>CancelCallback</b> or <b>MemoryCallback</b>, the <b>ProcessId</b>, <b>ProcessHandle</b>, and <b>CallbackType</b> members are valid but no other input is specified.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_input
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_CALLBACK_INPUT {
    #StructPack 8

    /**
     * The identifier of the process that contains callback function.
     * 
     * This member is not used if <b>CallbackType</b> is <b>IoStartCallback</b>.
     */
    ProcessId : UInt32

    /**
     * A handle to the process that contains the callback function.
     * 
     * This member is not used if <b>CallbackType</b> is <b>IoStartCallback</b>.
     */
    ProcessHandle : HANDLE

    /**
     * The type of callback function. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_callback_type">MINIDUMP_CALLBACK_TYPE</a> enumeration.
     */
    CallbackType : UInt32

    Status : HRESULT

    static __New() {
        DefineProp(this.Prototype, 'Thread', { type: MINIDUMP_THREAD_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'ThreadEx', { type: MINIDUMP_THREAD_EX_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'Module', { type: MINIDUMP_MODULE_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'IncludeThread', { type: MINIDUMP_INCLUDE_THREAD_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'IncludeModule', { type: MINIDUMP_INCLUDE_MODULE_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'Io', { type: MINIDUMP_IO_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'ReadMemoryFailure', { type: MINIDUMP_READ_MEMORY_FAILURE_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'SecondaryFlags', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'VmQuery', { type: MINIDUMP_VM_QUERY_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'VmPreRead', { type: MINIDUMP_VM_PRE_READ_CALLBACK, offset: 24 })
        DefineProp(this.Prototype, 'VmPostRead', { type: MINIDUMP_VM_POST_READ_CALLBACK, offset: 24 })
        this.DeleteProp("__New")
    }
}
