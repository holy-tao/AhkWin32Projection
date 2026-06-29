#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Describes the tape in the tape drive. It is used by the GetTapeParametersfunction.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-gettapeparameters">GetTapeParameters</a> function fills the <b>Remaining</b> and <b>Capacity</b> members with estimates of the tape remaining in the current tape partition and the total capacity of the current tape partition.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_get_media_parameters
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_GET_MEDIA_PARAMETERS {
    #StructPack 8

    /**
     * Total number of bytes on the current tape partition.
     */
    Capacity : Int64

    /**
     * Number of bytes between the current position and the end of the current tape partition.
     */
    Remaining : Int64

    /**
     * Number of bytes per block.
     */
    BlockSize : UInt32

    /**
     * Number of partitions on the tape.
     */
    PartitionCount : UInt32

    /**
     * If this member is <b>TRUE</b>, the tape is write-protected. Otherwise, it is not.
     */
    WriteProtected : BOOLEAN

}
