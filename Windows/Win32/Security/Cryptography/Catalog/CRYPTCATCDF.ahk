#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information used to create a signed catalog file (.cat) from a catalog definition file (CDF).
 * @remarks
 * A parser can update <i>dwCurFilePos</i> and <i>dwLastMemberOffset</i> as it reads the CDF. A user-defined callback function can use this information for recoverable parse errors in the CDF.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-cryptcatcdf
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCATCDF {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A handle to the catalog definition file (.cdf).
     */
    hFile : HANDLE

    /**
     * A value that specifies the current position of the parser measured in bytes from the beginning of the catalog definition file.
     */
    dwCurFilePos : UInt32

    /**
     * A value that specifies the number of bytes to the position of the last member parsed in the catalog definition file.
     */
    dwLastMemberOffset : UInt32

    /**
     * An integer that indicates whether the parser finished reading the file. <b>TRUE</b> indicates that the last read operation returned zero bytes.
     */
    fEOF : BOOL

    /**
     * A pointer to a null-terminated string that contains the name of a directory where the catalog file (.cat) will be written.
     */
    pwszResultDir : PWSTR

    /**
     * A handle to the catalog file (.cat).
     */
    hCATStore : HANDLE

}
