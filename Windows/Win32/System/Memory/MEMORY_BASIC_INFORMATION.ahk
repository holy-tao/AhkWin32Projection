#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAGE_PROTECTION_FLAGS.ahk" { PAGE_PROTECTION_FLAGS }
#Import ".\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }
#Import ".\PAGE_TYPE.ahk" { PAGE_TYPE }

/**
 * Contains information about a range of pages in the virtual address space of a process.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-memory_basic_information
 * @namespace Windows.Win32.System.Memory
 * @architecture X64, Arm64
 */
export default struct MEMORY_BASIC_INFORMATION {
    #StructPack 8

    /**
     * A pointer to the base address of the region of pages.
     */
    BaseAddress : IntPtr

    /**
     * A pointer to the base address of a range of pages allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function. The page pointed to by the <b>BaseAddress</b> member is contained within this allocation range.
     */
    AllocationBase : IntPtr

    /**
     * The memory protection option when the region was initially allocated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a> or 0 if the caller does not have access.
     */
    AllocationProtect : PAGE_PROTECTION_FLAGS

    PartitionId : UInt16

    /**
     * The size of the region beginning at the base address in which all pages have identical attributes, in bytes.
     */
    RegionSize : IntPtr

    State : VIRTUAL_ALLOCATION_TYPE

    /**
     * The access protection of the pages in the region. This member is one of the values listed for the <b>AllocationProtect</b> member.
     */
    Protect : PAGE_PROTECTION_FLAGS

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
     */
    Type : PAGE_TYPE

}
