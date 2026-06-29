#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Memory\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }

/**
 * Describes a region of memory.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MEMORY_INFO {
    #StructPack 8

    /**
     * The base address of the region of pages.
     */
    BaseAddress : Int64

    /**
     * The base address of a range of pages in this region. The page is contained within this memory region.
     */
    AllocationBase : Int64

    /**
     * The memory protection when the region was initially allocated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection">memory protection</a> options, along with PAGE_GUARD or PAGE_NOCACHE, as needed.
     */
    AllocationProtect : UInt32

    /**
     * A variable for alignment.
     */
    __alignment1 : UInt32

    /**
     * The size of the region beginning at the base address in which all pages have identical attributes, in bytes.
     */
    RegionSize : Int64

    State : VIRTUAL_ALLOCATION_TYPE

    /**
     * The access protection of the pages in the region. This member is one of the values listed for the <b>AllocationProtect</b> member.
     */
    Protect : UInt32

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
    Type : UInt32

    /**
     * A variable for alignment.
     */
    __alignment2 : UInt32

}
