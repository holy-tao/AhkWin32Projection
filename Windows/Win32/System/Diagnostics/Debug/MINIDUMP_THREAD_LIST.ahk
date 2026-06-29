#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_MEMORY_DESCRIPTOR.ahk" { MINIDUMP_MEMORY_DESCRIPTOR }
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }
#Import ".\MINIDUMP_THREAD.ahk" { MINIDUMP_THREAD }

/**
 * Contains a list of threads. (MINIDUMP_THREAD_LIST)
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_LIST {
    #StructPack 8

    /**
     * The number of structures in the <b>Threads</b> array.
     */
    NumberOfThreads : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_thread">MINIDUMP_THREAD</a> structures.
     */
    Threads : MINIDUMP_THREAD[1]

}
