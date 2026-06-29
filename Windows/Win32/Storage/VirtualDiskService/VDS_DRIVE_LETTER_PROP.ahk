#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the properties of a drive letter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-querydriveletters">IVdsService::QueryDriveLetters</a> method returns this structure to report the property details of a drive letter.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_drive_letter_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DRIVE_LETTER_PROP {
    #StructPack 4

    /**
     * The drive letter.
     */
    wcLetter : Int8

    /**
     * The GUID of the volume object represented by the drive letter.
     */
    volumeId : Guid

    /**
     * The drive letter flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_drive_letter_flag">VDS_DRIVE_LETTER_FLAG</a>.
     */
    ulFlags : UInt32

    /**
     * If true, the drive letter is already in use; otherwise, the drive letter is available.
     */
    bUsed : BOOL

}
