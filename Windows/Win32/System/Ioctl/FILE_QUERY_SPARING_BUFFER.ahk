#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains defect management properties.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_query_sparing_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_QUERY_SPARING_BUFFER {
    #StructPack 4

    /**
     * The size of a sparing packet and the underlying error check and correction (ECC) block size of the volume.
     */
    SparingUnitBytes : UInt32

    /**
     * If <b>TRUE</b>, indicates that sparing behavior is software-based; if <b>FALSE</b>, it is hardware-based.
     */
    SoftwareSparing : BOOLEAN

    /**
     * The total number of blocks allocated for sparing.
     */
    TotalSpareBlocks : UInt32

    /**
     * The  number of blocks available for sparing.
     */
    FreeSpareBlocks : UInt32

}
