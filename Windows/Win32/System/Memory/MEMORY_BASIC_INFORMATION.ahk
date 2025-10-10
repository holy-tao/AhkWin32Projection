#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a range of pages in the virtual address space of a process.
 * @remarks
 * 
  * To enable a debugger to debug a target that is running on a different architecture (32-bit versus 64-bit), use one of the explicit forms of this structure.
  * 
  * 
  * ```cpp
  * typedef struct _MEMORY_BASIC_INFORMATION32 {
  *     DWORD BaseAddress;
  *     DWORD AllocationBase;
  *     DWORD AllocationProtect;
  *     DWORD RegionSize;
  *     DWORD State;
  *     DWORD Protect;
  *     DWORD Type;
  * } MEMORY_BASIC_INFORMATION32, *PMEMORY_BASIC_INFORMATION32;
  * 
  * typedef struct DECLSPEC_ALIGN(16) _MEMORY_BASIC_INFORMATION64 {
  *     ULONGLONG BaseAddress;
  *     ULONGLONG AllocationBase;
  *     DWORD     AllocationProtect;
  *     DWORD     __alignment1;
  *     ULONGLONG RegionSize;
  *     DWORD     State;
  *     DWORD     Protect;
  *     DWORD     Type;
  *     DWORD     __alignment2;
  * } MEMORY_BASIC_INFORMATION64, *PMEMORY_BASIC_INFORMATION64;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-memory_basic_information
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class MEMORY_BASIC_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A pointer to the base address of the region of pages.
     * @type {Pointer<Void>}
     */
    BaseAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the base address of a range of pages allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function. The page pointed to by the <b>BaseAddress</b> member is contained within this allocation range.
     * @type {Pointer<Void>}
     */
    AllocationBase {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The memory protection option when the region was initially allocated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a> or 0 if the caller does not have access.
     * @type {Integer}
     */
    AllocationProtect {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PartitionId {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The size of the region beginning at the base address in which all pages have identical attributes, in bytes.
     * @type {Pointer}
     */
    RegionSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The access protection of the pages in the region. This member is one of the values listed for the <b>AllocationProtect</b> member.
     * @type {Integer}
     */
    Protect {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The type of pages in the region. The following types are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEM_IMAGE"></a><a id="mem_image"></a><dl>
     * <dt><b>MEM_IMAGE</b></dt>
     * <dt>0x1000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the memory pages within the region are mapped into the view of an image section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEM_MAPPED"></a><a id="mem_mapped"></a><dl>
     * <dt><b>MEM_MAPPED</b></dt>
     * <dt>0x40000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the memory pages within the region are mapped into the view of a section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEM_PRIVATE"></a><a id="mem_private"></a><dl>
     * <dt><b>MEM_PRIVATE</b></dt>
     * <dt>0x20000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the memory pages within the region are private (that is, not shared by other processes).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
