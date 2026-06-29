#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the starting VCN to the FSCTL_GET_RETRIEVAL_POINTERS control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-starting_vcn_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STARTING_VCN_INPUT_BUFFER {
    #StructPack 8

    /**
     * The VCN at which 
     * the operation will begin enumerating extents in the file. This value may be rounded down to the first VCN of the extent in which the specified extent is found.
     */
    StartingVcn : Int64

}
