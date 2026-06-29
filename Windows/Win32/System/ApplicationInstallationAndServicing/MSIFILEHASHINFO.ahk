#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MSIFILEHASHINFO structure contains the file hash information returned by MsiGetFileHash and used in the MsiFileHash table.
 * @remarks
 * The file hash entered into the fields of the MsiFileHash table must be obtained by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msigetfilehasha">MsiGetFileHash</a> or the 
 * <a href="https://docs.microsoft.com/windows/desktop/Msi/installer-filehash">FileHash method</a>. Do not use other methods to generate a file hash.
 * @see https://learn.microsoft.com/windows/win32/api/msi/ns-msi-msifilehashinfo
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIFILEHASHINFO {
    #StructPack 4

    /**
     * Specifies the size, in bytes, of this data structure. Set this member to <c>sizeof(MSIFILEHASHINFO)</c> before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msigetfilehasha">MsiGetFileHash</a> function.
     */
    dwFileHashInfoSize : UInt32

    /**
     * The entire 128-bit file hash is contained in four 32-bit fields. The first field corresponds to the HashPart1 column of the MsiHashFile table, the second field corresponds to the HashPart2 column, the third field corresponds to the HashPart3 column, and the fourth field corresponds to the HashPart4 column.
     */
    dwData : UInt32[4]

}
