#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains disk, volume, or partition length information used by the IOCTL_DISK_GET_LENGTH_INFO control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-get_length_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_LENGTH_INFORMATION {
    #StructPack 8

    /**
     * The length of the disk, volume, or partition, in bytes.
     */
    Length : Int64

}
