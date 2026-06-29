#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of memory.
 * @remarks
 * To compile an application that calls this function, define <b>_WIN32_WINNT</b> as 
 *     <b>_WIN32_WINNT_WIN8</b> or higher. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_range_entry
 * @namespace Windows.Win32.System.Memory
 */
export default struct WIN32_MEMORY_RANGE_ENTRY {
    #StructPack 8

    VirtualAddress : IntPtr

    NumberOfBytes : IntPtr

}
