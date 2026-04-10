#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\CONTEXT.ahk
#Include .\CONTEXT_FLAGS.ahk
#Include .\ARM64_NT_NEON128.ahk

/**
 * Contains thread information for the MiniDumpCallback function when the callback type is ThreadCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X86, X64
 */
class MINIDUMP_THREAD_CALLBACK extends Win32Struct {
    static sizeof => 3000

    static packingSize => 8

    /**
     * The identifier of the thread.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the thread
     * @type {HANDLE}
     */
    ThreadHandle {
        get {
            if(!this.HasProp("__ThreadHandle"))
                this.__ThreadHandle := HANDLE(8, this)
            return this.__ThreadHandle
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the processor-specific data.
     * @type {CONTEXT}
     */
    Context {
        get {
            if(!this.HasProp("__Context"))
                this.__Context := CONTEXT(16, this)
            return this.__Context
        }
    }

    /**
     * The size of the returned processor-specific data in the <b>Context</b> member, in bytes.
     * @type {Integer}
     */
    SizeOfContext {
        get => NumGet(this, 2976, "uint")
        set => NumPut("uint", value, this, 2976)
    }

    /**
     * The base address of the thread stack.
     * @type {Integer}
     */
    StackBase {
        get => NumGet(this, 2984, "uint")
        set => NumPut("uint", value, this, 2984)
    }

    /**
     * The ending address of the thread stack.
     * @type {Integer}
     */
    StackEnd {
        get => NumGet(this, 2992, "uint")
        set => NumPut("uint", value, this, 2992)
    }
}
