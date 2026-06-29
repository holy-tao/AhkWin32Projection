#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a memory region.
 * @remarks
 * The <b>WIN32_MEMORY_REGION_INFORMATION</b> structure contains information about a single memory allocation. In contrast, the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualquery">VirtualQuery</a> function describes a contiguous run of pages within a single allocation that all have the same type, state, and protection. The mapping between <b>WIN32_MEMORY_REGION_INFORMATION</b> fields and memory type values returned by <b>VirtualQuery</b> is as follows:
 * 
 * <table>
 * <tr>
 * <th>WIN32_MEMORY_REGION_INFORMATION</th>
 * <th>MEMORY_BASIC_INFORMATION::Type</th>
 * </tr>
 * <tr>
 * <td>Private</td>
 * <td>MEM_PRIVATE</td>
 * </tr>
 * <tr>
 * <td>MappedDataFile</td>
 * <td>MEM_MAPPED</td>
 * </tr>
 * <tr>
 * <td>MappedImage</td>
 * <td>MEM_IMAGE</td>
 * </tr>
 * <tr>
 * <td>MappedPageFile</td>
 * <td>MEM_MAPPED</td>
 * </tr>
 * <tr>
 * <td>MappedPhysical</td>
 * <td>MEM_MAPPED</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_region_information
 * @namespace Windows.Win32.System.Memory
 */
export default struct WIN32_MEMORY_REGION_INFORMATION {
    #StructPack 8

    /**
     * The base address of the allocation.
     */
    AllocationBase : IntPtr

    /**
     * The page protection value that was specified when the allocation was created. Protections of individual pages within the allocation can be different from this value. To query protection values of individual pages, use the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualquery">VirtualQuery</a> function.
     */
    AllocationProtect : UInt32

    Flags : UInt32


    /**
     * @type {Integer}
     */
    Private {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MappedDataFile {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MappedImage {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    MappedPageFile {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    MappedPhysical {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    DirectMapped {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    /**
     * The size of the allocation.
     */
    RegionSize : IntPtr

    /**
     * The commit charge associated with the allocation. For private allocations, this is the combined size of pages in the region that are committed, as opposed to reserved. For mapped views, this is the combined size of pages that have copy-on-write protection, or have been made private as a result of copy-on-write.
     */
    CommitSize : IntPtr

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 12 })
        this.DeleteProp("__New")
    }
}
