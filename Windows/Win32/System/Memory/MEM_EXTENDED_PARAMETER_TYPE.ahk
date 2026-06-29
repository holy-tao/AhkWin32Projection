#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for extended parameters used for file mapping into an address space.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mem_extended_parameter_type
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEM_EXTENDED_PARAMETER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterInvalidType => 0

    /**
     * This extended parameter type is used to specify alignment and virtual address range restrictions for new memory allocations created by <a href="../memoryapi/nf-memoryapi-virtualalloc2.md">VirtualAlloc2</a> and <a href="../memoryapi/nf-memoryapi-mapviewoffile3.md">MapViewOfFile3</a>.
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterAddressRequirements => 1

    /**
     * This extended parameter type is used to specify the preferred NUMA node for new memory allocations created by <a href="../memoryapi/nf-memoryapi-virtualalloc2.md">VirtualAlloc2</a> and <a href="../memoryapi/nf-memoryapi-mapviewoffile3.md">MapViewOfFile3</a>.
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterNumaNode => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterPartitionHandle => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterUserPhysicalHandle => 4

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterAttributeFlags => 5

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterImageMachine => 6

    /**
     * @type {Integer (Int32)}
     */
    static MemExtendedParameterMax => 7
}
