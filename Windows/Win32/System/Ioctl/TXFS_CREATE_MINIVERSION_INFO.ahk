#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the version information about the miniversion created by FSCTL_TXFS_CREATE_MINIVERSION.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_create_miniversion_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_CREATE_MINIVERSION_INFO {
    #StructPack 4

    /**
     * The version number of this <b>TXFS_CREATE_MINIVERSION_INFO</b> structure.
     */
    StructureVersion : UInt16

    /**
     * The length of this <b>TXFS_CREATE_MINIVERSION_INFO</b> structure.
     */
    StructureLength : UInt16

    /**
     * The identifier of the most recently committed version of the file.
     */
    BaseVersion : UInt32

    /**
     * The identifier of the newly-created miniversion.
     */
    MiniVersion : UInt16

}
