#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information for the MiniDumpCallback function when the callback type is IncludeThreadCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_include_thread_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_INCLUDE_THREAD_CALLBACK {
    #StructPack 4

    /**
     * The identifier of the thread.
     */
    ThreadId : UInt32

}
