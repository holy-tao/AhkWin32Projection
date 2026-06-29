#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information used to verify a disk extent.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-verify_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VERIFY_INFORMATION {
    #StructPack 8

    /**
     * The starting offset of the disk extent.
     */
    StartingOffset : Int64

    /**
     * The length of the disk extent, in bytes.
     */
    Length : UInt32

}
