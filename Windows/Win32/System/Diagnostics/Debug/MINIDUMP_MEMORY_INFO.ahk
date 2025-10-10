#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a region of memory.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_memory_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MEMORY_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The base address of the region of pages.
     * @type {Integer}
     */
    BaseAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The base address of a range of pages in this region. The page is contained within this memory region.
     * @type {Integer}
     */
    AllocationBase {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The memory protection when the region was initially allocated. This member can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection">memory protection</a> options, along with PAGE_GUARD or PAGE_NOCACHE, as needed.
     * @type {Integer}
     */
    AllocationProtect {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A variable for alignment.
     * @type {Integer}
     */
    __alignment1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The size of the region beginning at the base address in which all pages have identical attributes, in bytes.
     * @type {Integer}
     */
    RegionSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
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

    /**
     * A variable for alignment.
     * @type {Integer}
     */
    __alignment2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
