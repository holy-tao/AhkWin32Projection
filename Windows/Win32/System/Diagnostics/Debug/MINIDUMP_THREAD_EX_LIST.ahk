#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk
#Include .\MINIDUMP_MEMORY_DESCRIPTOR.ahk
#Include .\MINIDUMP_THREAD_EX.ahk

/**
 * Contains a list of threads. (MINIDUMP_THREAD_EX_LIST)
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_THREAD_EX_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of structures in the <b>Threads</b> array.
     * @type {Integer}
     */
    NumberOfThreads {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex">MINIDUMP_THREAD_EX</a> structures.
     * @type {Array<MINIDUMP_THREAD_EX>}
     */
    Threads{
        get {
            if(!this.HasProp("__ThreadsProxyArray"))
                this.__ThreadsProxyArray := Win32FixedArray(this.ptr + 8, 1, MINIDUMP_THREAD_EX, "")
            return this.__ThreadsProxyArray
        }
    }
}
