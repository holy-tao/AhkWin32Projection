#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the tape in the tape drive. It is used by the GetTapeParametersfunction.
 * @remarks
 * 
  * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-gettapeparameters">GetTapeParameters</a> function fills the <b>Remaining</b> and <b>Capacity</b> members with estimates of the tape remaining in the current tape partition and the total capacity of the current tape partition.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_get_media_parameters
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TAPE_GET_MEDIA_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Total number of bytes on the current tape partition.
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Number of bytes between the current position and the end of the current tape partition.
     * @type {Integer}
     */
    Remaining {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Number of bytes per block.
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of partitions on the tape.
     * @type {Integer}
     */
    PartitionCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * If this member is <b>TRUE</b>, the tape is write-protected. Otherwise, it is not.
     * @type {BOOLEAN}
     */
    WriteProtected {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
