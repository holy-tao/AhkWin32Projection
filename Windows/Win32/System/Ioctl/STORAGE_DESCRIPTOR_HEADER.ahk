#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the properties of a storage device or adapter.
 * @remarks
 * The data retrieved by 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> is reported in 
 *      the buffer immediately following this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_descriptor_header
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DESCRIPTOR_HEADER {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

}
