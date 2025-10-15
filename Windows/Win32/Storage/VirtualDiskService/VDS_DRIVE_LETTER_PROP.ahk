#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Defines the properties of a drive letter.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-querydriveletters">IVdsService::QueryDriveLetters</a> method returns this structure to report the property details of a drive letter.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_drive_letter_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_LETTER_PROP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The drive letter.
     * @type {Integer}
     */
    wcLetter {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The GUID of the volume object represented by the drive letter.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The drive letter flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_drive_letter_flag">VDS_DRIVE_LETTER_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If true, the drive letter is already in use; otherwise, the drive letter is available.
     * @type {BOOL}
     */
    bUsed{
        get {
            if(!this.HasProp("__bUsed"))
                this.__bUsed := BOOL(this.ptr + 20)
            return this.__bUsed
        }
    }
}
