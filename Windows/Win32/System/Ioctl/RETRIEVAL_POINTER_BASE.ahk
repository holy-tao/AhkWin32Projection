#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the output for the FSCTL_GET_RETRIEVAL_POINTER_BASE control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-retrieval_pointer_base
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct RETRIEVAL_POINTER_BASE {
    #StructPack 8

    /**
     * The volume-relative sector offset to the first allocatable unit on the file system, also referred to as the base of the cluster heap.
     */
    FileAreaOffset : Int64

}
