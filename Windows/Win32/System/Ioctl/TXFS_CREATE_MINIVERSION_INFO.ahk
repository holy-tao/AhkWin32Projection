#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the version information about the miniversion created by FSCTL_TXFS_CREATE_MINIVERSION.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_create_miniversion_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_CREATE_MINIVERSION_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The version number of this <b>TXFS_CREATE_MINIVERSION_INFO</b> structure.
     * @type {Integer}
     */
    StructureVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The length of this <b>TXFS_CREATE_MINIVERSION_INFO</b> structure.
     * @type {Integer}
     */
    StructureLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The identifier of the most recently committed version of the file.
     * @type {Integer}
     */
    BaseVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the newly-created miniversion.
     * @type {Integer}
     */
    MiniVersion {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
