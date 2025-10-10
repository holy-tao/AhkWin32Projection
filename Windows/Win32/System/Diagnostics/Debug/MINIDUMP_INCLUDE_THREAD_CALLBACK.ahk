#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information for the MiniDumpCallback function when the callback type is IncludeThreadCallback.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_include_thread_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_INCLUDE_THREAD_CALLBACK extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The identifier of the thread.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
