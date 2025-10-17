#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains defect management properties.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_query_sparing_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_QUERY_SPARING_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of a sparing packet and the underlying error check and correction (ECC) block size of the volume.
     * @type {Integer}
     */
    SparingUnitBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, indicates that sparing behavior is software-based; if <b>FALSE</b>, it is hardware-based.
     * @type {BOOLEAN}
     */
    SoftwareSparing {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The total number of blocks allocated for sparing.
     * @type {Integer}
     */
    TotalSpareBlocks {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The  number of blocks available for sparing.
     * @type {Integer}
     */
    FreeSpareBlocks {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
