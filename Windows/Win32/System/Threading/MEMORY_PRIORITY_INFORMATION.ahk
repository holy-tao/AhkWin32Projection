#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the memory priority for a thread or process.
 * @remarks
 * The memory priority of a thread or process serves as a hint to the memory manager when it trims pages from the working set. Other factors being equal, pages with lower memory priority are trimmed before pages with higher memory priority. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Memory/working-set">Working Set</a>.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class MEMORY_PRIORITY_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    MemoryPriority {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
