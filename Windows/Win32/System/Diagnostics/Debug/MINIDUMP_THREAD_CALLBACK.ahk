#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONTEXT_FLAGS.ahk" { CONTEXT_FLAGS }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CONTEXT.ahk" { CONTEXT }
#Import ".\ARM64_NT_NEON128.ahk" { ARM64_NT_NEON128 }

/**
 * Contains thread information for the MiniDumpCallback function when the callback type is ThreadCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X86, X64
 */
export default struct MINIDUMP_THREAD_CALLBACK {
    #StructPack 8

    /**
     * The identifier of the thread.
     */
    ThreadId : UInt32

    /**
     * A handle to the thread
     */
    ThreadHandle : HANDLE

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the processor-specific data.
     */
    Context : CONTEXT

    /**
     * The size of the returned processor-specific data in the <b>Context</b> member, in bytes.
     */
    SizeOfContext : UInt32

    /**
     * The base address of the thread stack.
     */
    StackBase : Int64

    /**
     * The ending address of the thread stack.
     */
    StackEnd : Int64

}
