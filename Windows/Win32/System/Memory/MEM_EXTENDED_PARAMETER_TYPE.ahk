#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for extended parameters used for file mapping into an address space.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mem_extended_parameter_type
 * @namespace Windows.Win32.System.Memory
 */
class MEM_EXTENDED_PARAMETER_TYPE extends Win32Enum {

    /**
     * Native name: MemExtendedParameterInvalidType
     * @type {Integer (Int32)}
     */
    static InvalidType => 0

    /**
     * This extended parameter type is used to specify alignment and virtual address range restrictions for new memory allocations created by <a href="../memoryapi/nf-memoryapi-virtualalloc2.md">VirtualAlloc2</a> and <a href="../memoryapi/nf-memoryapi-mapviewoffile3.md">MapViewOfFile3</a>.
     * Native name: MemExtendedParameterAddressRequirements
     * @type {Integer (Int32)}
     */
    static AddressRequirements => 1

    /**
     * This extended parameter type is used to specify the preferred NUMA node for new memory allocations created by <a href="../memoryapi/nf-memoryapi-virtualalloc2.md">VirtualAlloc2</a> and <a href="../memoryapi/nf-memoryapi-mapviewoffile3.md">MapViewOfFile3</a>.
     * Native name: MemExtendedParameterNumaNode
     * @type {Integer (Int32)}
     */
    static NumaNode => 2

    /**
     * Native name: MemExtendedParameterPartitionHandle
     * @type {Integer (Int32)}
     */
    static PartitionHandle => 3

    /**
     * Native name: MemExtendedParameterUserPhysicalHandle
     * @type {Integer (Int32)}
     */
    static UserPhysicalHandle => 4

    /**
     * Native name: MemExtendedParameterAttributeFlags
     * @type {Integer (Int32)}
     */
    static AttributeFlags => 5

    /**
     * Native name: MemExtendedParameterImageMachine
     * @type {Integer (Int32)}
     */
    static ImageMachine => 6

    /**
     * Native name: MemExtendedParameterMax
     * @type {Integer (Int32)}
     */
    static Max => 7
}
