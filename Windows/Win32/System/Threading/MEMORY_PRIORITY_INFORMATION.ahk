#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEMORY_PRIORITY.ahk" { MEMORY_PRIORITY }

/**
 * Specifies the memory priority for a thread or process.
 * @remarks
 * The memory priority of a thread or process serves as a hint to the memory manager when it trims pages from the working set. Other factors being equal, pages with lower memory priority are trimmed before pages with higher memory priority. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Memory/working-set">Working Set</a>.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information
 * @namespace Windows.Win32.System.Threading
 */
export default struct MEMORY_PRIORITY_INFORMATION {
    #StructPack 4

    MemoryPriority : MEMORY_PRIORITY

}
