#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESTOREPOINTINFO_EVENT_TYPE.ahk" { RESTOREPOINTINFO_EVENT_TYPE }
#Import ".\RESTOREPOINTINFO_TYPE.ahk" { RESTOREPOINTINFO_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information used by the SRSetRestorePoint function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The srrestoreptapi.h header defines RESTOREPOINTINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa
 * @namespace Windows.Win32.System.Restore
 * @charset ANSI
 */
export default struct RESTOREPOINTINFOA {
    #StructPack 8

    dwEventType : RESTOREPOINTINFO_EVENT_TYPE

    dwRestorePtType : RESTOREPOINTINFO_TYPE

    /**
     * The sequence number of the restore point. To end a system change, set this to the sequence number returned by the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/srrestoreptapi/nf-srrestoreptapi-srsetrestorepointa">SRSetRestorePoint</a>.
     */
    llSequenceNumber : Int64

    /**
     * The description to be displayed so the user can easily identify a restore point. The maximum length of an ANSI string is MAX_DESC. The maximum length of a Unicode string is MAX_DESC_W. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/restore-point-description-text">Restore Point Description Text</a>.
     */
    szDescription : CHAR[64]

}
