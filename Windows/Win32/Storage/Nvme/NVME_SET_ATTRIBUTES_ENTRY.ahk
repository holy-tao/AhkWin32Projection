#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify information for setting an attribute.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_set_attributes_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SET_ATTRIBUTES_ENTRY {
    #StructPack 4

    /**
     * Indicates the identifier of the attribute.
     */
    Identifier : UInt16

    ENDGID : UInt16

    /**
     * A reserved field.
     */
    Reserved1 : UInt32

    Random4KBReadTypical : UInt32

    /**
     * Indicates the optimal write size.
     */
    OptimalWriteSize : UInt32

    /**
     * Indicates the total capacity.
     */
    TotalCapacity : Int8[16]

    /**
     * Indicates the unallocated capacity.
     */
    UnallocatedCapacity : Int8[16]

    Reserved2 : Int8[80]

}
