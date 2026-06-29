#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CONTEXT_ATTRIBUTES.ahk" { NVME_CONTEXT_ATTRIBUTES }

/**
 * Contains parameters that define a collection of contiguous logical blocks specified by a starting LBA and number of logical blocks.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_lba_range
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LBA_RANGE {
    #StructPack 8

    /**
     * A [NVME_CONTEXT_ATTRIBUTES](ns-nvme-nvme_context_attributes.md) structure that specifies context attributes for the logical block range.
     * 
     * The use of this information is optional and the controller is not required to perform any specific action.
     */
    Attributes : NVME_CONTEXT_ATTRIBUTES

    /**
     * Specifies the length of the LBA range in logical blocks.
     */
    LogicalBlockCount : UInt32

    /**
     * Specifies the starting logical block in the range.
     */
    StartingLBA : Int64

}
