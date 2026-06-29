#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the output for the FSCTL_GET_RETRIEVAL_POINTERS control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-retrieval_pointers_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct RETRIEVAL_POINTERS_BUFFER {
    #StructPack 8

    /**
     * The count of elements in the <b>Extents</b> array.
     */
    ExtentCount : UInt32

    /**
     * The starting VCN returned by the function call. This is not necessarily the VCN requested by the function call, as the file system driver may round down to the first VCN of the extent in which the requested starting VCN is found.
     */
    StartingVcn : Int64

    NextVcn : Int64

    Lcn : Int64

}
