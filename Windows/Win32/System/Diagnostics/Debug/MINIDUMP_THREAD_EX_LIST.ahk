#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_MEMORY_DESCRIPTOR.ahk" { MINIDUMP_MEMORY_DESCRIPTOR }
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }
#Import ".\MINIDUMP_THREAD_EX.ahk" { MINIDUMP_THREAD_EX }

/**
 * Contains a list of threads. (MINIDUMP_THREAD_EX_LIST)
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_EX_LIST {
    #StructPack 8

    /**
     * The number of structures in the <b>Threads</b> array.
     */
    NumberOfThreads : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex">MINIDUMP_THREAD_EX</a> structures.
     */
    Threads : MINIDUMP_THREAD_EX[1]

}
