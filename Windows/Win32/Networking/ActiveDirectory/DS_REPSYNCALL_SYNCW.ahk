#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPSYNCALL_SYNC structure identifies a single replication operation performed between a source, and destination, server by the DsReplicaSyncAll function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_REPSYNCALL_SYNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repsyncall_syncw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset Unicode
 */
export default struct DS_REPSYNCALL_SYNCW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the DNS GUID of the source server.
     */
    pszSrcId : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the DNS GUID of the destination server.
     */
    pszDstId : PWSTR

    pszNC : PWSTR

    pguidSrc : Guid.Ptr

    pguidDst : Guid.Ptr

}
