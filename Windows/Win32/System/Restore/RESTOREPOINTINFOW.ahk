#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used by the SRSetRestorePoint function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The srrestoreptapi.h header defines RESTOREPOINTINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfow
 * @namespace Windows.Win32.System.Restore
 * @version v4.0.30319
 * @charset Unicode
 */
class RESTOREPOINTINFOW extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwEventType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRestorePtType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The sequence number of the restore point. To end a system change, set this to the sequence number returned by the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/srrestoreptapi/nf-srrestoreptapi-srsetrestorepointa">SRSetRestorePoint</a>.
     * @type {Integer}
     */
    llSequenceNumber {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The description to be displayed so the user can easily identify a restore point. The maximum length of an ANSI string is MAX_DESC. The maximum length of a Unicode string is MAX_DESC_W. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/restore-point-description-text">Restore Point Description Text</a>.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }
}
